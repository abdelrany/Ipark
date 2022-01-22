import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipark/maps/map.dart';
import 'package:ipark/widgets/gmap.dart';
//import 'package:ipark/login/login.dart';
// import 'package:ipark/maps/map.dart';
// import 'package:ipark/Login/email_login.dart';
// import 'package:ipark/main.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

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
    return const Scaffold(
      // appBar: AppBar(
      //   title: Text(MyApp.title),
      // ),
      body: Map(),
    );
  }
}
