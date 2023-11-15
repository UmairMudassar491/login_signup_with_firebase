library my_prj;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showToast(txt, {String type = 'default'}) {
  Color bgColor = Colors.black54;
  Color txtColor = Colors.white;
  switch (type.toLowerCase()) {
    case 'error':
      bgColor = Colors.red;
      break;
    case 'warning':
      bgColor = Colors.yellow;
      txtColor = Colors.black;
      break;
    case 'success':
      bgColor = Colors.green;
      break;
    default:
      bgColor = Colors.black54;
      break;
  }
  Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: bgColor,
      textColor: txtColor,
      fontSize: 16.0);
}
