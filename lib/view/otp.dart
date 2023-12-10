// import 'package:authentication_crud/helpers/colors.dart';
// import 'package:authentication_crud/view/home_page.dart';
// import 'package:authentication_crud/view/otp_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   final otpController = TextEditingController();
//   String phonenumber = "";
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String smscode = "";
//   _signInWithMobileNumber() async {
//     UserCredential _credential;
//     User user;
//     try {

//       await _auth.verifyPhoneNumber(
//         phoneNumber: '91'+phonenumber.trim(),
//           verificationCompleted: (PhoneAuthCredential authCredential) async {
//             await _auth.signInWithCredential(authCredential).then((value) => {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => HomePage(),
//                   ))
//                 });
//           },
//           verificationFailed: ((error) {
//             print('error');
//           }),
//           codeSent: (String verificationId, [int? forceResendingToken]) {
//             showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (context) => AlertDialog(
//                 title: Text('Enter OTP'),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       controller: otpController,
//                     )
//                   ],
//                 ),
//                 actions: [
//                   ElevatedButton(
//                       onPressed: () {
//                         FirebaseAuth auth = FirebaseAuth.instance;
//                         smscode = otpController.text;
//                         PhoneAuthCredential _credential =
//                             PhoneAuthProvider.credential(
//                                 verificationId: verificationId,
//                                 smsCode: smscode);
//                         auth
//                             .signInWithCredential(_credential)
//                             .then((result) => {
//                                   if (result != null)
//                                     {
//                                       Navigator.pop(context),
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => HomePage(),
//                                           ))
//                                     }
//                                 })
//                             .catchError((e) {
//                           print(e);
//                         });
//                       },
//                       child: Text('Done'))
//                 ],
//               ),
//             );
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {
//             verificationId = verificationId;
//           },
//           timeout: Duration(seconds: 45));
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 300, right: 20, left: 20),
//             child: TextField(
//                 controller: otpController,
//                 decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     focusedBorder: const OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     fillColor: Colors.white,
//                     filled: true,
//                     hintText: 'Enter your phone number',
//                     hintStyle: TextStyle(color: Colors.grey.shade700))),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           FloatingActionButton.extended(
//             onPressed: () {
//               _signInWithMobileNumber();
//             },
//             label: const Text(
//               'Get OTP',
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: appcolor,
//           ),
//         ]),
//       ),
//     );
//   }
// }


import 'package:authentication_crud/helpers/colors.dart';
import 'package:authentication_crud/view/home_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  String phoneNumber = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smsCode = "";

  Future<void> _signInWithMobileNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          await _auth.signInWithCredential(authCredential).then((value) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          });
        },
        verificationFailed: (FirebaseAuthException error) {
          print('Error: ${error.message}');
        },
        codeSent: (String verificationId, [int? forceResendingToken]) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text('Enter OTP'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: otpController,
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    smsCode = otpController.text;
                    PhoneAuthCredential _credential = PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: smsCode,
                    );
                    auth.signInWithCredential(_credential).then((result) {
                      if (result != null) {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    }).catchError((e) {
                      print(e);
                    });
                  },
                  child: const Text('Done'),
                )
              ],
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        },
        timeout: const Duration(seconds: 45),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 300, right: 20, left: 20),
              child: TextField(
                onChanged: (value) {
                  phoneNumber = value;
                },
                controller: otpController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your phone number',
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                _signInWithMobileNumber();
              },
              label: const Text(
                'Get OTP',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: appcolor,
            ),
          ],
        ),
      ),
    );
  }
}

