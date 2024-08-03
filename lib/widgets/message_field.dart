
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class MyMessageField extends StatelessWidget {
  final TextEditingController controller;
  const MyMessageField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: 8,
      maxLines: null,
      cursorColor: Colors.black54,
      cursorWidth: 1,
      style: TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
        hintText: 'Your Message.....' ,
        hintStyle: TextStyle(color: CustomColor.hintDark)
      ),
    );
  }
}