// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB7tUcgAzQulp5Kh83_Qmh89nygIpb7VGU',
    appId: '1:921717970496:web:563feb890771f921cd71a5',
    messagingSenderId: '921717970496',
    projectId: 'authentication-crud-59048',
    authDomain: 'authentication-crud-59048.firebaseapp.com',
    storageBucket: 'authentication-crud-59048.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATtAwrYN7wTqAwIG3ONG4Lr-MUOQl3RPs',
    appId: '1:921717970496:android:fb62ae9ed8fb405bcd71a5',
    messagingSenderId: '921717970496',
    projectId: 'authentication-crud-59048',
    storageBucket: 'authentication-crud-59048.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7HAS4i-afpwwSLDFhlKmhPckoYRxaZ5k',
    appId: '1:921717970496:ios:e559a3d9eae7f263cd71a5',
    messagingSenderId: '921717970496',
    projectId: 'authentication-crud-59048',
    storageBucket: 'authentication-crud-59048.appspot.com',
    iosBundleId: 'com.example.authenticationCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7HAS4i-afpwwSLDFhlKmhPckoYRxaZ5k',
    appId: '1:921717970496:ios:ecef85d7585822dacd71a5',
    messagingSenderId: '921717970496',
    projectId: 'authentication-crud-59048',
    storageBucket: 'authentication-crud-59048.appspot.com',
    iosBundleId: 'com.example.authenticationCrud.RunnerTests',
  );
}
