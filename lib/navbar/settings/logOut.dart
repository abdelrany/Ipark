// ignore_for_file: unnecessary_new

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class logOut extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: Text('Log Out'),
//         backgroundColor: Colors.blue,
//       ),
//       body: FloatingActionButton(
//         onPressed: () => exit(0),
//         tooltip: 'Close app',
//         child: new Icon(Icons.close),
//       ),
//     );
//   }
// }

class logOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exit App"),
        backgroundColor: Colors.blue,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State<Demo> {
  Future exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(
          'Are you sure?',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        content: new Text(
          'Do you want to exit form the app?',
          style: TextStyle(fontSize: 16.0),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: new Text(
              'EXIT',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: new Text(
              'CANCEL',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future.value(false);
      },
      child: Scaffold(
        //   appBar: AppBar(
        //     title: Text('Exit Button'),
        //   ),
        body: Center(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              exitDialog();
            },
            child: Text('Exit'),
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
