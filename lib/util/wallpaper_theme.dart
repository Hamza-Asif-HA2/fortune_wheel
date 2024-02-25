import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class WallpaperTheme extends StatelessWidget {
  final String theme;
  final IconData iconData;

  WallpaperTheme({
    super.key,
    required this.theme,
    required this.iconData,
  });

// List for shadow of Container
  List<BoxShadow> shadow = [
    BoxShadow(
      offset: Offset(4, 4),
      color: Colors.grey.shade500,
      blurRadius: 8,
      spreadRadius: 2,
    ),
    BoxShadow(
      offset: Offset(-4, -4),
      color: Colors.white,
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
              boxShadow: shadow,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: Icon(iconData),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            theme,
            style: GoogleFonts.bebasNeue(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
