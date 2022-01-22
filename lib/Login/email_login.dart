import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipark/navbar/navigation.dart';
import 'package:ipark/screens/home/home_screan.dart';
import 'package:ipark/main.dart';
import '../widgets/login_text.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoggingIn = false;

  _logIn() async {
    setState(() {
      isLoggingIn = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.of(context).pushNamedAndRemoveUntil(
          BottomNavigationPage.tag, (Route<dynamic> route) => false);

      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => BottomNavigationPage()));
    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'The email you entered was invalid';
          break;
        case 'user-disabled':
          message = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          message = 'The user you tried to log into was not found';
          break;
        case 'wrong-password':
          message = 'Incorrect password';
          break;
      }

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Log in failed'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok')),
              ],
            );
          });
    } finally {
      setState(() {
        isLoggingIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('I park',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 5),
            Text('Log in',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            if (!isLoggingIn)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        _logIn();
                      },
                      child: Text('Log in')),
                ),
              ),
            if (isLoggingIn) ...[
              const SizedBox(height: 16),
              Center(child: CircularProgressIndicator()),
            ]
          ],
        ),
      ),
    );
  }
}
