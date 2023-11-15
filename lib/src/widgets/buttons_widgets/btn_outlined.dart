import 'package:flutter/material.dart';

class BtnOutlinedWidget extends StatelessWidget {
  const BtnOutlinedWidget(
      {super.key,
      required this.onPressed,
      required this.btnText,
      required this.width,
      required this.height});
  final VoidCallback onPressed;
  final String btnText;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  width: 3.0,
                  color: Color(0xFF07767D),
                  style: BorderStyle.solid),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              shadowColor: Colors.black,
              elevation: 8,
              backgroundColor: Colors.white),
          onPressed: onPressed,
          child: Text(btnText)),
    );
  }
}
