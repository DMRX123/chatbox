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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBSAQ5FfeqhaU-KPwgbCE2tfctm090_9vk',
    appId: '1:523545274249:web:229ae4128216a308202358',
    messagingSenderId: '523545274249',
    projectId: 'chatbox-830c5',
    authDomain: 'chatbox-830c5.firebaseapp.com',
    storageBucket: 'chatbox-830c5.firebasestorage.app',
    measurementId: 'G-GEY41W6J9X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPwuMuPqfjhHBz_tgzlt8rNk5Zg25nFpQ',
    appId: '1:523545274249:android:42eb53a00727cd86202358',
    messagingSenderId: '523545274249',
    projectId: 'chatbox-830c5',
    storageBucket: 'chatbox-830c5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCpAuZwa0VvVRJDrlhewKoDgi9DSl-iSk',
    appId: '1:523545274249:ios:9f6c9460e5165e27202358',
    messagingSenderId: '523545274249',
    projectId: 'chatbox-830c5',
    storageBucket: 'chatbox-830c5.firebasestorage.app',
    iosBundleId: 'com.example.testFirebaseWeb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCpAuZwa0VvVRJDrlhewKoDgi9DSl-iSk',
    appId: '1:523545274249:ios:9f6c9460e5165e27202358',
    messagingSenderId: '523545274249',
    projectId: 'chatbox-830c5',
    storageBucket: 'chatbox-830c5.firebasestorage.app',
    iosBundleId: 'com.example.testFirebaseWeb',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBSAQ5FfeqhaU-KPwgbCE2tfctm090_9vk',
    appId: '1:523545274249:web:01aa5eb7776c1ff1202358',
    messagingSenderId: '523545274249',
    projectId: 'chatbox-830c5',
    authDomain: 'chatbox-830c5.firebaseapp.com',
    storageBucket: 'chatbox-830c5.firebasestorage.app',
    measurementId: 'G-FFB1L6ZKBN',
  );
}
