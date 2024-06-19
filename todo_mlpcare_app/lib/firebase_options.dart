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
    apiKey: 'AIzaSyDnfEla5T28MBIR5kFuJGyJ3CfowPpSZVI',
    appId: '1:401211579684:web:0bfdab211fe58acfd327b1',
    messagingSenderId: '401211579684',
    projectId: 'flutter-todo-demo-app',
    authDomain: 'flutter-todo-demo-app.firebaseapp.com',
    storageBucket: 'flutter-todo-demo-app.appspot.com',
    measurementId: 'G-GDPYHMVRHS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmcvXw7nvbuTbcjUr5wvwKP7bPDbOxW5U',
    appId: '1:401211579684:android:52272b28ba699569d327b1',
    messagingSenderId: '401211579684',
    projectId: 'flutter-todo-demo-app',
    storageBucket: 'flutter-todo-demo-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwGoHshrBZsj6OfWUSQ-5AWYfIBBa-xnw',
    appId: '1:401211579684:ios:e90ebe13fc94800bd327b1',
    messagingSenderId: '401211579684',
    projectId: 'flutter-todo-demo-app',
    storageBucket: 'flutter-todo-demo-app.appspot.com',
    iosBundleId: 'com.example.todoMlpcareApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwGoHshrBZsj6OfWUSQ-5AWYfIBBa-xnw',
    appId: '1:401211579684:ios:e90ebe13fc94800bd327b1',
    messagingSenderId: '401211579684',
    projectId: 'flutter-todo-demo-app',
    storageBucket: 'flutter-todo-demo-app.appspot.com',
    iosBundleId: 'com.example.todoMlpcareApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDnfEla5T28MBIR5kFuJGyJ3CfowPpSZVI',
    appId: '1:401211579684:web:58987cfafc15b53ed327b1',
    messagingSenderId: '401211579684',
    projectId: 'flutter-todo-demo-app',
    authDomain: 'flutter-todo-demo-app.firebaseapp.com',
    storageBucket: 'flutter-todo-demo-app.appspot.com',
    measurementId: 'G-RE9ZT4QKL7',
  );
}