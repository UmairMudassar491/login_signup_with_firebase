import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';

class CirculerImageViewWidget extends StatelessWidget {
  const CirculerImageViewWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: borderColor,
        ),
      ),
      child: ClipRRect(
        child: child,
      ),
    );
  }
}
