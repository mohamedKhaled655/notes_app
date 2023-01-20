abstract class AddNoteStates{}

class AddNoteInitialState extends AddNoteStates{}
class AddNoteSuccessState extends AddNoteStates{}
class AddNoteLoadingState extends AddNoteStates{}
class AddNoteFaliureState extends AddNoteStates{
  final String message;

  AddNoteFaliureState(this.message);
}
