import 'package:flutter/material.dart';
import 'package:login_signup/src/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final String? prefixText;
  final Widget? prefixIconWidget;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnPressed;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final Widget? prefixWidget;
  final String? obscuringCharacter;
  final int? maxLines;
  final int? maxLength;

  const TextFormFieldWidget(
      {super.key,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.keyboardType,
      this.textInputAction,
      this.onChanged,
      this.onFieldSubmitted,
      this.obscureText = false,
      //this.prefixIcon,
      this.validator,
      this.maxLines,
      this.maxLength,
      this.prefixText,
      this.suffixIcon,
      this.suffixIconOnPressed,
      this.obscuringCharacter,
      this.prefixWidget, this.prefixIconWidget});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? "*",
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
      decoration: InputDecoration(
        prefix: prefixWidget,
        prefixIcon: prefixIconWidget,
        suffixIcon: IconButton(
          color: textColor,
          onPressed: suffixIconOnPressed,
          icon: Icon(suffixIcon),
        ),
        counterStyle: const TextStyle(color: Colors.white),
        labelText: label,
        labelStyle: const TextStyle(color: textColor),
        hintText: hintText,
        helperStyle: TextStyle(color: Colors.grey.shade400),
        prefixText: prefixText,
        prefixStyle: const TextStyle(fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 4.0),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
