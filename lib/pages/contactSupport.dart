import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/authorize/MyTextField.dart';
import 'package:fortune_wheel/util/myButton.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/noteTextField.dart';

class contactSupport extends StatelessWidget {
  contactSupport({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Contact Support',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Contact Us',
                style: GoogleFonts.poppins(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              MyTextField(
                hintText: 'Email',
                IconsData: Icons.email_outlined,
                obscureText: false,
                controller: _emailController,
              ),
              SizedBox(height: 20.0),
              MyTextField(
                hintText: 'Subject',
                IconsData: Icons.subject,
                obscureText: false,
                controller: _subController,
              ),
              SizedBox(height: 20.0),
              MyNoteTextField(
                hintText: 'Note',
                IconsData: Icons.note_alt_outlined,
                obscureText: false,
                controller: _noteController,
              ),
              MyButton(
                ButtonText: 'Submit',
                onTap: () {
                  print('Note Submitted');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
