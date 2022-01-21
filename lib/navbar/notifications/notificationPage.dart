// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Park Here",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                //Need to add space below this Text ?
                new Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //build function returns a "Widget"
    return Scaffold(
        appBar: AppBar(
          title: new Text('Details'),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset('assets/images/park1.jpg', fit: BoxFit.cover),
            //You can add more widget bellow
            titleSection
          ],
        )); //Widget with "Material design"
  }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Details"),
//         backgroundColor: Colors.blue,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: new Row(
//         children: <Widget>[
//           new Expanded(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Container(
//                   padding: const EdgeInsets.only(bottom: 10.0),
//                   child: new Text("Programming tutorials Channel",
//                       style: new TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18.0)),
//                 ),
//                 //Need to add space below this Text ?
//                 new Text(
//                   "This channel contains tutorial videos in Flutter, "
//                   "React Native, React, Angular",
//                   style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ),
//           new Icon(Icons.favorite, color: Colors.red),
//           new Text(
//             " 100",
//             style: new TextStyle(fontSize: 16.0),
//           ),
//         ],
//       ),
//     );
//     //build function returns a "Widget"
//     return new MaterialApp(
//         title: "",
//         home: new Scaffold(
//             appBar: new AppBar(
//               title: new Text('Flutter App'),
//             ),
//             body: new ListView(
//               children: <Widget>[
//                 new Image.asset('assets/park.jpg', fit: BoxFit.cover),
//                 //You can add more widget bellow
//               ],
//             ))); //Widget with "Material design"
//   }
// }

  //     body: FittedBox(
  //       child: Container(
  //         // height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         margin: EdgeInsets.all(24),
  //         padding: EdgeInsets.all(24),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             shape: BoxShape.rectangle,
  //             borderRadius: BorderRadius.circular(8.0),
  //             boxShadow: [BoxShadow(color: Colors.white, blurRadius: 2.0)]),
  //         child: Column(
  //           children: [
  //             Text(
  //               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  //             ),
  //             SizedBox(height: 16.0),
  //             Image(image: AssetImage('assets/park1.jpg')),
  //             SizedBox(height: 16.0),
  //             Text(
  //                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
  //                 style: TextStyle(color: Colors.black)),
  //             SizedBox(height: 16.0),
  //             Align(
  //               alignment: Alignment.centerRight,
  //               child: Text('11/Feb/2021 04:42 PM',
  //                   style: TextStyle(color: Colors.black)),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
