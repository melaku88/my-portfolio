
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLine;
  const MyTextField({super.key, required this.controller, required this.hintText, required this.maxLine});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      cursorColor: Colors.black54,
      cursorWidth: 1,
      style: TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        filled: true,
        fillColor: CustomColor.textFieldBg,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: hintText ,
        hintStyle: TextStyle(color: CustomColor.hintDark)
      ),
    );
  }
}