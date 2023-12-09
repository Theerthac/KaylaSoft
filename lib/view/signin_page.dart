import 'package:authentication_crud/helpers/colors.dart';
import 'package:authentication_crud/widgets/button.dart';
import 'package:authentication_crud/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  final Function()? onTap;
  const SignInPage({super.key, this.onTap});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 244, 244),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text("Hello!",
                    style: TextStyle(
                        color: appcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                Text("Welcome back",
                    style: TextStyle(
                        color: appcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 75,
                ),
                TextFieldWidget(
                    controller: emailTextController,
                    hintText: 'Email',
                    obcureText: false),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                    controller: passwordTextController,
                    hintText: 'Password',
                    obcureText: true),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: 224),
                    child: const Text(
                      "Forgot Password ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: appcolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ButtonWidget(onTap: signIn, text: 'Sign In'),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "   Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appcolor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}