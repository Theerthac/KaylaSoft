import 'package:authentication_crud/helpers/colors.dart';
import 'package:authentication_crud/widgets/button.dart';
import 'package:authentication_crud/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({super.key, this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

 

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      backgroundColor: const Color.fromARGB(255, 247, 244, 244),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text("Hello!",
                    style: TextStyle(
                        color: appcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const Text("Welcome back",
                    style: TextStyle(
                        color: appcolor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
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
                const SizedBox(
                  height: 40,
                ),
                ButtonWidget(
                  onTap: signUp,
                  text: 'Sign Up',
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          color: appcolor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                  SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset("assets/googleimg-removebg-preview.png",
                    height: 55,
                    width: 55,
                    fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(onPressed: (){

                  }, 
                  icon: Icon(Icons.phone_iphone_sharp,size: 35,))
                  
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
