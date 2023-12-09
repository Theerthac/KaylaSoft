import 'package:authentication_crud/helpers/colors.dart';
import 'package:authentication_crud/widgets/button.dart';
import 'package:authentication_crud/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

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

                 
                    //  onTap: widget.onTap,
                      GestureDetector(
                        onTap: (){},
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
                      SizedBox(height: 40,),
                    
                ButtonWidget(onTap: (){}, text: 'Sign In'),
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
                     //onTap: widget.onTap,
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

                SizedBox(height: 40,),
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
