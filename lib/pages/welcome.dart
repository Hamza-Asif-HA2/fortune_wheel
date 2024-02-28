// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/authorize/auth_user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text
              Text(
                'Luckki Wheel',
                style: GoogleFonts.pacifico(
                  fontSize: 54,
                ),
              ),
              //animation
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: LottieBuilder.network(
                    "https://lottie.host/769cc02a-a150-4cd9-a724-1a83d7df9a4b/XHdqQUtM2L.json"),
              ),

              //button

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthUser(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 4),
                          color: Colors.grey.shade500,
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          offset: Offset(-4, -4),
                          color: Colors.white,
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 22,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
