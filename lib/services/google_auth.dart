// import 'package:authentication_crud/services/database.dart';
// import 'package:authentication_crud/view/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthMethods {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   getCurrentUser() async {
//     return auth.currentUser;
//   }

//   signInWithGoogle(BuildContext context) async {
//     final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();

//     final GoogleSignInAuthentication? googleSignInAuthentication =
//         await googleSignInAccount?.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       idToken: googleSignInAuthentication?.idToken,
//       accessToken: googleSignInAuthentication?.accessToken,
//     );

//     UserCredential result = await firebaseAuth.signInWithCredential(credential);
//     User? userDetails = result.user;

//     if (result != null) {
//       Map<String, dynamic> userInfoMap = {
//         'email': userDetails!.email,
//         'name': userDetails.displayName,
//         'imgUrl': userDetails.photoURL,
//         'id': userDetails.uid
//       };
//       await DataBaseMethods()
//           .addUser(userDetails.uid, userInfoMap)
//           .then((value) {
//         //Navigator.pop(context);
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const HomePage(),
//             ));
//       });
//     }
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   // Sign in with Google
//   Future<User?> signInWithGoogle() async {
//     try {
//       // Trigger the Google Sign In process
//       final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

//       if (googleSignInAccount == null) {
//         // User canceled the sign-in process
//         return null;
//       }

//       // Obtain the GoogleSignInAuthentication object
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       // Create a new credential using the GoogleSignInAuthentication object
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       // Sign in to Firebase with the Google Auth credentials
//       final UserCredential authResult = await _auth.signInWithCredential(credential);
//       final User? user = authResult.user;

//       return user;
//     } catch (e) {
//       print("Error during Google sign-in: $e");
//       return null;
//     }
//   }

//   // Sign out
//   Future<void> signOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//   }
// }
