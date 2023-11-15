import 'package:flutter/material.dart';

Widget appName(String title) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: title, style: const TextStyle(color: Colors.white)),
      ],
    ),
  );
}
