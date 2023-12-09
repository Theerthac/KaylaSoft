import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obcureText;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obcureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obcureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade700)
    )
    );
  }
}
