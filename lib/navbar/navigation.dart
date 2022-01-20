// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ipark/home.dart';
import 'package:ipark/navbar/Settings.dart';
import 'package:ipark/navbar/booking.dart';
import 'package:ipark/navbar/notofications.dart';

class BottomNavigationPage extends StatefulWidget {
  static String tag = 'BottomNavigationPage'; /* add this line*/
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    Notifications(),
    Booking(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        // currentIndex :_currentIndex,
        onTap: _changeItem,
      ),
    );
  }

  void _changeItem(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
