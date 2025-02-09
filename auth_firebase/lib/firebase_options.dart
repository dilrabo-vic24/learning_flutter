// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAi4fp498EIYHcjvrtQxTtYNeWNcMotHvc',
    appId: '1:492597376851:web:8179b95028f7fcb5c813a6',
    messagingSenderId: '492597376851',
    projectId: 'fir-auth-example-91bcc',
    authDomain: 'fir-auth-example-91bcc.firebaseapp.com',
    storageBucket: 'fir-auth-example-91bcc.firebasestorage.app',
    measurementId: 'G-733GN8WBZY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_HGZVfVi46qs8lifZib5C04OzZ0TJp1o',
    appId: '1:492597376851:android:a11cc35b19082351c813a6',
    messagingSenderId: '492597376851',
    projectId: 'fir-auth-example-91bcc',
    storageBucket: 'fir-auth-example-91bcc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvsIXFKqeJBK3LSlZf0SnP6wp1PSRqVaw',
    appId: '1:492597376851:ios:46d9d370e506f33fc813a6',
    messagingSenderId: '492597376851',
    projectId: 'fir-auth-example-91bcc',
    storageBucket: 'fir-auth-example-91bcc.firebasestorage.app',
    iosBundleId: 'com.example.authFirebase',
  );

}