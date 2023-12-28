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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_Vm6ctvukfrbdMbQmqBxDBPVlYoaJ03g',
    appId: '1:374565220105:android:8f440cbcab34b004e1add8',
    messagingSenderId: '374565220105',
    projectId: 'h3lth-project',
    databaseURL: 'https://h3lth-project-default-rtdb.firebaseio.com',
    storageBucket: 'h3lth-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-WUqOqLZGvStSyn4kL9mp2aVQi4DTcsI',
    appId: '1:374565220105:ios:91ffb583e4e47b35e1add8',
    messagingSenderId: '374565220105',
    projectId: 'h3lth-project',
    databaseURL: 'https://h3lth-project-default-rtdb.firebaseio.com',
    storageBucket: 'h3lth-project.appspot.com',
    iosClientId: '374565220105-8ribeko2g1oa541kv4cm737opi61vds6.apps.googleusercontent.com',
    iosBundleId: 'com.example.secondOpinionApp',
  );
}