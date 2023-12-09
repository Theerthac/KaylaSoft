
import 'package:authentication_crud/widgets/button.dart';
import 'package:authentication_crud/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  final Function()? onTap;
  const ForgotPage({super.key, this.onTap});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // void signUp() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );

  //   if (passwordTextController.text != confirmPasswordController.text) {
  //     Navigator.pop(context);
  //     displayMessage("Passwords don't match!");
  //     return;
  //   }

  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailTextController.text,
  //         password: passwordTextController.text);
  //     if (context.mounted) Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     // ignore: use_build_context_synchronously
  //     Navigator.pop(context);
  //     displayMessage(e.code);
  //   }
  // }

  // void displayMessage(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(message),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 244, 244),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                Text("Reset your Password",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade800,
                    )),
                const SizedBox(
                  height: 25,
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
                TextFieldWidget(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obcureText: true),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(onTap: (){}, text: 'Save'),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
