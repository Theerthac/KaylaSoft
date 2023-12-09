
import 'package:authentication_crud/widgets/button.dart';
import 'package:authentication_crud/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function()? onTap;
  const SignUp({super.key, this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();


  // void signUp() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );

    // if (passwordTextController.text != confirmPasswordController.text) {
    //   Navigator.pop(context);
    //   displayMessage("Passwords don't match!");
    //   return;
    // }

    // try {
    //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: emailTextController.text,
    //       password: passwordTextController.text);
    //   if (context.mounted) Navigator.pop(context);
    // } on FirebaseAuthException catch (e) {
    //   // ignore: use_build_context_synchronously
    //   Navigator.pop(context);
    //   displayMessage(e.code);
    // }
  //}

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
      backgroundColor: const Color.fromARGB(255, 234, 207, 207),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text("Already have an account?",
                    style: TextStyle(
                      color: Colors.grey.shade700,
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
           
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(onTap: (){}, text: 'Sign Up'),
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
                        "   Sign In",
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
