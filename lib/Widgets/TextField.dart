// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, duplicate_ignore, must_be_immutable, prefer_typing_uninitialized_variables
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  Widget? beforeIcon;
  var textEditingController;
  var validator;
  var onchanged;
  TextFieldWidget(
      {required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      this.beforeIcon,
      this.textEditingController,
      this.onchanged,
      this.validator, required Null Function(dynamic data) onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      validator: validator,
      onChanged: onchanged,
      controller: textEditingController,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: beforeIcon,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black)),
        labelText: text,
        labelStyle: GoogleFonts.nunito(
            color: color, fontWeight: fontWeight, fontSize: fontSize),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Colors.amber,
            style: BorderStyle.solid,
          ),
        ),
      ),
    ));
  }
}
