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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBRf-Sc15JX6N4erS4slCWS6y8ErYBEVbg',
    appId: '1:197268497519:web:b118b16d42b8c0ff40599a',
    messagingSenderId: '197268497519',
    projectId: 'flutter-firebase-auth-ee71a',
    authDomain: 'flutter-firebase-auth-ee71a.firebaseapp.com',
    storageBucket: 'flutter-firebase-auth-ee71a.appspot.com',
    measurementId: 'G-N7ZWPS3N9X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSQbJDuDa-bqMhm7hN426RcVOAvJY8Xco',
    appId: '1:197268497519:android:df12ca8b4588898d40599a',
    messagingSenderId: '197268497519',
    projectId: 'flutter-firebase-auth-ee71a',
    storageBucket: 'flutter-firebase-auth-ee71a.appspot.com',
  );
}
