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
    apiKey: 'AIzaSyBR4K_PBmVP3Snkhs3d65VJ0GVddwVjEIU',
    appId: '1:881500624649:web:310fa0d9766071bac0a5d8',
    messagingSenderId: '881500624649',
    projectId: 'fbnoteapp1',
    authDomain: 'fbnoteapp1.firebaseapp.com',
    storageBucket: 'fbnoteapp1.appspot.com',
    measurementId: 'G-X95VLRZMSP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBujNq6Yct1rno1SGI5xSo-m4ipTVt8C9g',
    appId: '1:881500624649:android:c1fbd0e3c7c54931c0a5d8',
    messagingSenderId: '881500624649',
    projectId: 'fbnoteapp1',
    storageBucket: 'fbnoteapp1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCW5N8OCd4BLX11Lv2-vSfdcXxjnPWu098',
    appId: '1:881500624649:ios:5bc411305517a9e9c0a5d8',
    messagingSenderId: '881500624649',
    projectId: 'fbnoteapp1',
    storageBucket: 'fbnoteapp1.appspot.com',
    iosBundleId: 'com.example.noteAppFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCW5N8OCd4BLX11Lv2-vSfdcXxjnPWu098',
    appId: '1:881500624649:ios:5bc411305517a9e9c0a5d8',
    messagingSenderId: '881500624649',
    projectId: 'fbnoteapp1',
    storageBucket: 'fbnoteapp1.appspot.com',
    iosBundleId: 'com.example.noteAppFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBR4K_PBmVP3Snkhs3d65VJ0GVddwVjEIU',
    appId: '1:881500624649:web:514ca042385bc454c0a5d8',
    messagingSenderId: '881500624649',
    projectId: 'fbnoteapp1',
    authDomain: 'fbnoteapp1.firebaseapp.com',
    storageBucket: 'fbnoteapp1.appspot.com',
    measurementId: 'G-SHDFZXKQP5',
  );
}
