import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/authorize/MyTextField.dart';
import 'package:fortune_wheel/util/SquareTile.dart';
import 'package:fortune_wheel/util/myButton.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();

  final _psController = TextEditingController();

  //sign in method for user
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _psController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
        Navigator.pop(context);
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        print('OOPS! =>  $e');
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Incorrect Email',
            style: GoogleFonts.poppins(),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Incorrect Password',
              style: GoogleFonts.poppins(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //LOGO X Name
                Icon(
                  Icons.casino_outlined,
                  size: 98,
                ),
                const SizedBox(
                  height: 25,
                ),

                //Text (Welcome Back! you've been missed.)
                Text(
                  'Welcome Back! you\'ve been missed',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 25,
                ), //bit of space

                //Email and Password TextField
                MyTextField(
                  hintText: 'Username or Email',
                  IconsData: Icons.email,
                  obscureText: false,
                  controller: _emailController,
                ),
                MyTextField(
                  hintText: 'Password',
                  IconsData: Icons.password_outlined,
                  obscureText: true,
                  controller: _psController,
                ),

                const SizedBox(
                  height: 10,
                ), //bit of more space

                //HyperText: Forgot Password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                //button for signing in
                MyButton(
                  ButtonText: 'Sign In',
                  onTap: signUserIn,
                ),

                const SizedBox(
                  height: 20, //more space
                ),

                //Text (or continue with)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        'or continue with',
                        style: GoogleFonts.poppins(
                          color: Colors.grey[700],
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10, //more space
                ),

                //Or continue with Google and apple images
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'images/google.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    SquareTile(imagePath: 'images/apple.png'),
                  ],
                ),

                const SizedBox(
                  height: 50, //more space
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Register Now!',
                      style: GoogleFonts.poppins(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
