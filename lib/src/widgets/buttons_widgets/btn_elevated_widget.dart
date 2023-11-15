import 'package:flutter/material.dart';

class BtnElevatedWidget extends StatelessWidget {
  const BtnElevatedWidget(
      {super.key,
      required this.onPressed,
      
      required this.width,
      required this.height, required this.child});
  final VoidCallback onPressed;
 
  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              width: 3.0,
              color: Color(0xFF07767D),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadowColor: Colors.black,
            elevation: 8,
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
