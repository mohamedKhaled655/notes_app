import 'package:flutter/material.dart';
import 'package:notes_app/utils/constans.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final void Function()? onTap;
  const CustomButton({Key? key, this.onTap, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kPrimaryColor,
        ),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                : Text(
                    "Add",
                    style: Styles.textStyle20.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
      ),
    );
  }
}
