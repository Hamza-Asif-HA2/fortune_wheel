import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Popular extends StatelessWidget {
  final String name1;
  final String name2;
  final String image1;
  final String image2;

  const Popular({
    Key? key,
    required this.name1,
    required this.image1,
    required this.name2,
    required this.image2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 110,
              width: 145,
              child: Stack(
                children: [
                  Image.asset(image1),
                  Positioned(
                    bottom: 12,
                    left: 14,
                    child: Text(
                      name1,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // Adjust the borderRadius here
            child: Container(
              height: 110,
              width: 145,
              child: Stack(
                children: [
                  Image.asset(image2),
                  Positioned(
                    bottom: 12,
                    left: 14,
                    child: Text(
                      name2,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
