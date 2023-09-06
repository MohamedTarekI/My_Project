

import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
  required Color background,
  bool isUpperCase =true,
  double raduis =0.0,
  required Function function,
  required String text,

}) =>
    Container(
      height: 40.0,
  width: width,
  child: MaterialButton(
    onPressed:()
    {
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
          color: Colors.white
      ),
    ),
  ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          raduis,
        ),
        color: background,
      ),
);