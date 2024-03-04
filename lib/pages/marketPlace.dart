import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class marketPlace extends StatelessWidget {
  const marketPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 85.0),
          child: Text(
            'S  H  O  P',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'WATCH ADS AND EARN COINS',
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
