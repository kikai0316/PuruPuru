import 'package:flutter/material.dart';

const mainBackgroundColor = Colors.white;
const subBackgroundColor = Color(0xFFF6F7F9);
const mainTextColor = Colors.black;
const blueColor = Color(0xFF01FFF5);
const blueColor2 = Color(0xFF01FFCB);
const yellowColor = Color(0xFFDDFE1D);

Gradient mainGradation() {
  return const LinearGradient(
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    colors: [blueColor, blueColor2],
  );
}
