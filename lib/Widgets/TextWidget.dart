// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextWidget extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextWidget({
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
                  text,
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                          color: color,
                          fontSize: fontSize,
                          fontWeight: fontWeight)),
                ),
    );
  }
}