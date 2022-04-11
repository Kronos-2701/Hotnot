import 'package:flutter/material.dart';

class CustomTextStyle {
  poppins500() {
    return TextStyle(
      fontFamily: "Poppins",
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );
  }

  poppins(double? size, final color) {
    return TextStyle(fontFamily: "Poppins", color: color, fontSize: size);
  }

  poppins400(double? size, final color) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size);
  }

  boldHeading(double? size, final color) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: size);
  }

  Heading(double? size, final color) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: size);
  }
}
