import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipark/login/login.dart';
import 'package:ipark/pages/slides.dart';
import 'login/email_login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialization = Firebase.initializeApp();

  static String title = "I park";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          return MaterialApp(
            title: title,
            theme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: Slides(),
          );
        });
  }
}
