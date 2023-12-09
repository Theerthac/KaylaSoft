import 'package:authentication_crud/helpers/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const ButtonWidget({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: appcolor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(text,
          style: const TextStyle(color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
