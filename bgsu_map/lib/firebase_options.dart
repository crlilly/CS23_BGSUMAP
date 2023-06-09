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
    apiKey: 'AIzaSyAuyP2kax55pw-mW1htdkMVp4YCTx6lE9Y',
    appId: '1:891827822894:web:cff987a19537fb7b7d5abf',
    messagingSenderId: '891827822894',
    projectId: 'bgsu-map',
    authDomain: 'bgsu-map.firebaseapp.com',
    storageBucket: 'bgsu-map.appspot.com',
    measurementId: 'G-TTSCJQ0W4H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBodYs6EMbg9iCPaQeXIezQ-a5zi2K53EE',
    appId: '1:891827822894:android:2427f95b903d2fd97d5abf',
    messagingSenderId: '891827822894',
    projectId: 'bgsu-map',
    storageBucket: 'bgsu-map.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0lp7mCznlMnjriaEfTRB6RvkYGALKOzA',
    appId: '1:891827822894:ios:3a75e22b733fd6407d5abf',
    messagingSenderId: '891827822894',
    projectId: 'bgsu-map',
    storageBucket: 'bgsu-map.appspot.com',
    iosClientId: '891827822894-bi5mjo1j2idifdjlgeaa67ona1pnnvks.apps.googleusercontent.com',
    iosBundleId: 'com.example.bgsuMap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0lp7mCznlMnjriaEfTRB6RvkYGALKOzA',
    appId: '1:891827822894:ios:3a75e22b733fd6407d5abf',
    messagingSenderId: '891827822894',
    projectId: 'bgsu-map',
    storageBucket: 'bgsu-map.appspot.com',
    iosClientId: '891827822894-bi5mjo1j2idifdjlgeaa67ona1pnnvks.apps.googleusercontent.com',
    iosBundleId: 'com.example.bgsuMap',
  );
}
