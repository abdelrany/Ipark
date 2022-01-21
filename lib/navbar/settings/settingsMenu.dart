// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'profile/myAccountMenu.dart';
// import 'profile/profile.dart';
// import 'logOut.dart';
// import 'payment/creditCard.dart';
// import 'feedback.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// // ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

// // import '../settings/settingsMenu.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// // import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// // class Settings extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(title: Text("Settings")), body: profileBody() //Profile
// //         );
// //   }
// // }

// // class Setting extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: "Settings",
// //       theme: ThemeData(primarySwatch: Colors.blue), //Profile
// //     );
// //   }
// // }

// class SettingsMenu extends StatelessWidget {
//   SettingsMenu({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child: Column(
//         children: [
//           // ProfilePic(),
//           SizedBox(height: 20),
//           ProfileMenu(
//             text: "Profile",
//             //icon: Icon("assets/User Icon.svg"),
//             press: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EditProfilePage()),
//               )
//             },
//           ),

//           ProfileMenu(
//             text: "Credit Card",
//             //icon: "assets/Bell.svg",
//             press: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CreditCardPage()),
//               )
//             },
//           ),
//           ProfileMenu(
//             text: "Feedback",
//             //icon: "assets/Question.svg",
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => FeedBack()),
//               );
//             },
//           ),
//           ProfileMenu(
//             text: "Log Out",
//             //icon: "assets/Log out.svg",
//             press: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => logOut()),
//               )
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
