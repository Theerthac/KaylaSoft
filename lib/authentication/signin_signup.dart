import 'package:authentication_crud/view/signin_page.dart';
import 'package:authentication_crud/view/signup.dart';
import 'package:flutter/material.dart';

class SigninOrsignup extends StatefulWidget {
  const SigninOrsignup({super.key});

  @override
  State<SigninOrsignup> createState() => _SigninOrsignupState();
}

class _SigninOrsignupState extends State<SigninOrsignup> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInPage(
            onTap: togglePages,
          );
    } else {
      return SignUpPage(
            onTap: togglePages,
          );
    }
  }
}
