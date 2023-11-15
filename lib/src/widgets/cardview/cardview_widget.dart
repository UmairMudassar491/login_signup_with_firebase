import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';

class CardviewWidget extends StatelessWidget {
  const CardviewWidget(
      {super.key, required this.borderRadius, required this.child});

  final BorderRadiusGeometry borderRadius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor.withOpacity(0.65),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: borderColor.withOpacity(0.4), width: 1.0)),
      child: child,
    );
  }
}
