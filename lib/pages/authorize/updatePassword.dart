import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/authorize/MyTextField.dart';
import 'package:fortune_wheel/util/myButton.dart';
import 'package:google_fonts/google_fonts.dart';

class updatePassword extends StatelessWidget {
  updatePassword({super.key});

  final _pscontroller = TextEditingController();
  final _newpscontroller = TextEditingController();
  final _cNewpscontroller = TextEditingController();

  void updatepassword(BuildContext context) async {
    String currentPassword = _pscontroller.text.trim();
    String newPassword = _newpscontroller.text.trim();
    String confirmNewPassword = _cNewpscontroller.text.trim();

    if (newPassword != confirmNewPassword) {
      // Show error message if new passwords don't match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('New passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Get the current user
    final user = FirebaseAuth.instance.currentUser!;

    // Create a credential with the user's current email and password
    AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!, password: currentPassword);

    try {
      // Re-authenticate the user
      await user.reauthenticateWithCredential(credential);

      // Update the user's password
      await user.updatePassword(newPassword);

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Password updated successfully"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade300,
            title: Text("Error"),
            content: Text("Failed to update password: $e"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Change Password',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Current Password',
              IconsData: Icons.password_outlined,
              obscureText: true,
              controller: _pscontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'New Password',
              IconsData: Icons.password_outlined,
              obscureText: true,
              controller: _newpscontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: 'Confirm new Password',
              IconsData: Icons.password_outlined,
              obscureText: true,
              controller: _cNewpscontroller,
            ),
            MyButton(
              ButtonText: 'Update Password',
              onTap: () => updatepassword(context),
            )
          ],
        ),
      ),
    );
  }
}
