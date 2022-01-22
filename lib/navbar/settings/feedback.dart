// import 'package:flutter/material.dart';

// class FeedBack extends StatefulWidget {
//   @override
//   _feddBackState createState() => _feddBackState();
// }

// class _feddBackState extends State<FeedBack> {
//   List<bool> isTypeSelected = [false, false, false, true, true];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.blue,
//         elevation: 2.0,
//         title: Text(
//           "Feedback",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 10.0,
//             ),
//             Text(
//               "Please select the type of the feedback",
//               style: TextStyle(
//                 color: Color(0xFFC5C5C5),
//               ),
//             ),
//             SizedBox(height: 25.0),
//             GestureDetector(
//               child: buildCheckItem(
//                   title: "Login trouble", isSelected: isTypeSelected[0]),
//               onTap: () {
//                 setState(() {
//                   isTypeSelected[0] = !isTypeSelected[0];
//                 });
//               },
//             ),
//             GestureDetector(
//               child: buildCheckItem(
//                   title: "Personal profile", isSelected: isTypeSelected[2]),
//               onTap: () {
//                 setState(() {
//                   isTypeSelected[2] = !isTypeSelected[2];
//                 });
//               },
//             ),
//             GestureDetector(
//               child: buildCheckItem(
//                   title: "Other issues", isSelected: isTypeSelected[3]),
//               onTap: () {
//                 setState(() {
//                   isTypeSelected[3] = !isTypeSelected[3];
//                 });
//               },
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             buildFeedbackForm(),
//             SizedBox(height: 20.0),
//             //Spacer(),
//             Row(
//               //crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 RaisedButton(
//                     //padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Container(
//                       margin: const EdgeInsets.all(8),
//                       child: const Text(
//                         'Send',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     color: Colors.blue,
//                     onPressed: () {
//                       _showValidDialog(
//                           context, "Thank You", "Thank's for your feedback!");
//                     })
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   buildFeedbackForm() {
//     return Container(
//       height: 200,
//       child: Stack(
//         children: [
//           TextField(
//             maxLines: 10,
//             decoration: InputDecoration(
//               hintText: "Please briefly describe the issue",
//               hintStyle: TextStyle(
//                 fontSize: 13.0,
//                 color: Color(0xFFC5C5C5),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Color(0xFFE5E5E5),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<AlertDialog> _showValidDialog(
//     BuildContext context,
//     String title,
//     String content,
//   ) {
//     showDialog<AlertDialog>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: Text(title),
//           content: Text(content),
//           actions: [
//             FlatButton(
//                 child: Text(
//                   "Ok",
//                   style: TextStyle(fontSize: 18, color: Colors.blue),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 }),
//           ],
//         );
//       },
//     );
//   }

//   Widget buildCheckItem({String title, bool isSelected}) {
//     return Container(
//       padding: const EdgeInsets.all(6.0),
//       child: Row(
//         children: [
//           Icon(
//             isSelected ? Icons.check_circle : Icons.circle,
//             color: isSelected ? Colors.blue : Colors.grey,
//           ),
//           SizedBox(width: 10.0),
//           Text(
//             title,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: isSelected ? Colors.blue : Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }
