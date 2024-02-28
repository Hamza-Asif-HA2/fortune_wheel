import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/Wheel.dart';
import 'package:fortune_wheel/pages/authorize/login.dart';

class AuthUser extends StatelessWidget {
  const AuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if user is logged in
          if (snapshot.hasData) {
            return Wheel();
          }
          //if user is not logged in
          else
            return LoginPage();
        },
      ),
    );
  }
}
