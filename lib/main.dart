import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipark/login/login.dart';

import 'login/email_login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          return MaterialApp(
            title: 'iPARK',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Login(),
          );
        });
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    testFirebase();
    super.initState();
  }

  testFirebase() async {
    final initApp = await Firebase.initializeApp();
    print(initApp);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
