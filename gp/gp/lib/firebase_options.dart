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
    apiKey: 'AIzaSyAWYWUd46Y1s69azC5giMzDmRCB15MXxhM',
    appId: '1:253549062632:web:3d37d8d7b1c23b414c9c5d',
    messagingSenderId: '253549062632',
    projectId: 'auth-c7497',
    authDomain: 'auth-c7497.firebaseapp.com',
    storageBucket: 'auth-c7497.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8hMpUP7yffuuLFzXTF48FUaga_XqOW-w',
    appId: '1:253549062632:android:c260ebf2d0c0ad7c4c9c5d',
    messagingSenderId: '253549062632',
    projectId: 'auth-c7497',
    storageBucket: 'auth-c7497.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGXo7iabn6zL8_jjQAK-ktIuusgfeSDeM',
    appId: '1:253549062632:ios:98d87d7f75a0091f4c9c5d',
    messagingSenderId: '253549062632',
    projectId: 'auth-c7497',
    storageBucket: 'auth-c7497.appspot.com',
    iosBundleId: 'com.example.gp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGXo7iabn6zL8_jjQAK-ktIuusgfeSDeM',
    appId: '1:253549062632:ios:632b84cb484461744c9c5d',
    messagingSenderId: '253549062632',
    projectId: 'auth-c7497',
    storageBucket: 'auth-c7497.appspot.com',
    iosBundleId: 'com.example.gp.RunnerTests',
  );
}
