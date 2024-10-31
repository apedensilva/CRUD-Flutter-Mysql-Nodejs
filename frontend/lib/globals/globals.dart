import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

double? screenWidth;
double? screenHeight;

void setDimensions(double width, double height) {
  screenWidth = width;
  screenHeight = height;
}

class Notif {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
