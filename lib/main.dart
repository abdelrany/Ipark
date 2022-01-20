import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipark/home.dart';
import 'package:ipark/login/login.dart';
import 'package:ipark/pages/slides.dart';
import 'package:ipark/sign_up/sign_up.dart';
import 'login/email_login.dart';
import 'package:ipark/navbar/navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialization = Firebase.initializeApp();
  static String title = "I park";
  final routes = <String, WidgetBuilder>{
    /* add this line */
    BottomNavigationPage.tag: (context) => BottomNavigationPage(),
    /* add this line */
    // SignUp.tag: (context) => SignIn(), /* add this line */
  }; /* add this line */

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
              primarySwatch: Colors.blue,
            ),
            home: Slides(),
            routes: routes, /* add this line */
          );
        });
  }
}
