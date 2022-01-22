// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:ipark/screens/home/home.dart';
import '../Login/login.dart';
// import 'package:ipark/main.dart';

// import 'bNavPages/bottom_navigation_page.dart';
// import 'bNavPages/home_page.dart';
// import '../widget/button_widget.dart';

class Slides extends StatelessWidget {

  //route name method
  static const String routeName = '/slides';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => Slides(),
      settings: RouteSettings(name: routeName),
    );



  }
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Welcome to IPark',
              body:
                  'Find the best possible parking space nearby your desired destination.',
              image: buildImage('assets/images/firstSlide.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Park your bike ',
              body:
                  'Available for bikes to find also their spot whenevr they need ',
              image: buildImage('assets/images/secondSlide.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'It works on cars',
              body:
                  'For enhanced parking experience its integrated with car\'s screan',
              image: buildImage('assets/images/thirdSlide.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Save time, Save money, save yourself ',
              body:
                  'be part of one of the biggest parking app that will make your life easier',
              // -------------- get started button ----------
              // footer: ButtonWidget(
              //   text: 'Start Reading',
              //   onClicked: () => goToHome(context),
              // ),
              image: buildImage('assets/images/fourthSlide.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('Let\'s start',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              )),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text('Skip'),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Colors.white,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: true,
          // isProgress: true,
          // showNextButton: true,
          // // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Login()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.blue,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
