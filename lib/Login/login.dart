import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ipark/login/email_login.dart';
import 'package:ipark/navbar/navigation.dart';
import 'package:ipark/sign_up/sign_up.dart';
import 'package:ipark/widgets/submit_button.dart';

import '../widgets/login_text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loading = false;
  

  void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });

    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => BottomNavigationPage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'This operation is not allowed';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into was not found';
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Log in with facebook failed'),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void _logInWithGoogle() async {
    setState(() {
      loading = true;
    });

    final googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        setState(() {
          loading = false;
        });
        return;
      }

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance.collection('users').add({
        'email': googleSignInAccount.email,
        'imageUrl': googleSignInAccount.photoUrl,
        'name': googleSignInAccount.displayName,
      });

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => BottomNavigationPage()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exists with a different sign in provider';
          break;
        case 'invalid-credential':
          content = 'Unknown error has occurred';
          break;
        case 'operation-not-allowed':
          content = 'This operation is not allowed';
          break;
        case 'user-disabled':
          content = 'The user you tried to log into is disabled';
          break;
        case 'user-not-found':
          content = 'The user you tried to log into was not found';
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Log in with google failed'),
                content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Log in with google failed'),
                content: Text('An unknown error occurred'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
    } finally {
      setState(() {
        loading = false;
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
            const LoginText('Welcome'),
            const SizedBox(height: 5),
            const LoginText('To Ipark'),
            if (loading) ...[
              const SizedBox(height: 15),
              const Center(child: const CircularProgressIndicator()),
            ],
            if (!loading) ...[
              _Button(
                text: 'Log in with email',
                color: Colors.grey.shade600,
                image: const AssetImage('assets/images/email.png'),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EmailLogin()));
                },
              ),
              _Button(
                text: 'Log in with Facebook',
                color: Colors.blue,
                image: const AssetImage('assets/images/facebook.png'),
                onPressed: () {
                  _logInWithFacebook();
                },
              ),
              _Button(
                text: 'Log in with Google',
                color: Colors.green,
                image: const AssetImage('assets/images/google.png'),
                onPressed: () {
                  _logInWithGoogle();
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 42, right: 42),
                child: Divider(color: Colors.grey.shade500),
              ),
              SubmitButton(
                text: 'Sign up',
                padding: 22,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SignUp()));
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final Color color;
  final ImageProvider image;
  final String text;
  final VoidCallback onPressed;

  _Button(
      {required this.color,
      required this.image,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              const SizedBox(width: 5),
              Image(
                image: image,
                width: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text, style: TextStyle(color: color, fontSize: 18)),
                    const SizedBox(width: 35),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
