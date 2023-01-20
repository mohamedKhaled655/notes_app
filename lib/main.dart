import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/utils/bloc_observer.dart';
import 'package:notes_app/utils/constans.dart';

import 'cubits/add_note_cubit/add_note_cubit.dart';
import 'models/note_model.dart';
import 'views/notes_app.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..fetchNote(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness:Brightness.dark ,
          fontFamily: "Poppins",
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xff62fcd7),
        ),
        home: const NotesApp(),
      ),
    );
  }
}

