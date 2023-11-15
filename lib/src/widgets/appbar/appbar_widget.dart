import 'package:flutter/material.dart';
import 'package:online_quran_learning/src/constants/text_string.dart';

Widget appName() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: mAppName, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

// void showSnackbar(context, color, message) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(
//         message,
//         style: const TextStyle(fontSize: 14),
//       ),
//       backgroundColor: color,
//       duration: const Duration(seconds: 2),
//       action: SnackBarAction(
//         label: "OK",
//         onPressed: () {},
//         textColor: Colors.white,
//       ),
//     ),
//   );
// }
