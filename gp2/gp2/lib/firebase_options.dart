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
    apiKey: 'AIzaSyCvPoyb7HL4w0XnBFXIatgPZAtkXXu92io',
    appId: '1:734547538532:web:42ae758fb717ec0db72571',
    messagingSenderId: '734547538532',
    projectId: 'gp-2-316aa',
    authDomain: 'gp-2-316aa.firebaseapp.com',
    storageBucket: 'gp-2-316aa.appspot.com',
    measurementId: 'G-7742GNHK3T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC11J0-0nE4ub38yo5lvPQsVk-S6oSYzvs',
    appId: '1:734547538532:android:d2fb9b238b560521b72571',
    messagingSenderId: '734547538532',
    projectId: 'gp-2-316aa',
    storageBucket: 'gp-2-316aa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFgyAaFDcSrqvV_EA7EEQ7nuwQuip4MoA',
    appId: '1:734547538532:ios:62a79a33b31fdeb9b72571',
    messagingSenderId: '734547538532',
    projectId: 'gp-2-316aa',
    storageBucket: 'gp-2-316aa.appspot.com',
    iosBundleId: 'com.example.gp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFgyAaFDcSrqvV_EA7EEQ7nuwQuip4MoA',
    appId: '1:734547538532:ios:3438a41e8f81edabb72571',
    messagingSenderId: '734547538532',
    projectId: 'gp-2-316aa',
    storageBucket: 'gp-2-316aa.appspot.com',
    iosBundleId: 'com.example.gp2.RunnerTests',
  );
}
