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
    apiKey: 'AIzaSyBMSdeRZzvoP46-DPfVy8QMejKe-Oz05cs',
    appId: '1:450594756464:web:082a09c6c7fcaa7904a1b5',
    messagingSenderId: '450594756464',
    projectId: 'fierbase-all-tutorial',
    authDomain: 'fierbase-all-tutorial.firebaseapp.com',
    storageBucket: 'fierbase-all-tutorial.appspot.com',
    measurementId: 'G-QQFZ0H9RTB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBav2qZMZP-UZfTGNx7JuNhn_SQXHrqZqM',
    appId: '1:450594756464:android:a9355dca5712f2c704a1b5',
    messagingSenderId: '450594756464',
    projectId: 'fierbase-all-tutorial',
    storageBucket: 'fierbase-all-tutorial.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCx9J6UjYfDKgUi7qRE4CxxaNlHAAPmm_s',
    appId: '1:450594756464:ios:dab5cbf5246501ea04a1b5',
    messagingSenderId: '450594756464',
    projectId: 'fierbase-all-tutorial',
    storageBucket: 'fierbase-all-tutorial.appspot.com',
    iosBundleId: 'com.example.fierbaseTutorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCx9J6UjYfDKgUi7qRE4CxxaNlHAAPmm_s',
    appId: '1:450594756464:ios:dab5cbf5246501ea04a1b5',
    messagingSenderId: '450594756464',
    projectId: 'fierbase-all-tutorial',
    storageBucket: 'fierbase-all-tutorial.appspot.com',
    iosBundleId: 'com.example.fierbaseTutorial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMSdeRZzvoP46-DPfVy8QMejKe-Oz05cs',
    appId: '1:450594756464:web:83ed015391212f8a04a1b5',
    messagingSenderId: '450594756464',
    projectId: 'fierbase-all-tutorial',
    authDomain: 'fierbase-all-tutorial.firebaseapp.com',
    storageBucket: 'fierbase-all-tutorial.appspot.com',
    measurementId: 'G-6XV4JNQCN9',
  );
}
