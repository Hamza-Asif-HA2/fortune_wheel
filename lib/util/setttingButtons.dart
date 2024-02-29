import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settingsButton extends StatelessWidget {
  final String SettingName;
  final IconData yourSettingIcon;

  settingsButton({
    super.key,
    required this.SettingName,
    required this.yourSettingIcon,
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
    return Container(
      height: 65,
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          18,
        ),
        color: Colors.grey[300],
        boxShadow: shadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            SettingName,
            style: GoogleFonts.bebasNeue(
              fontSize: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Icon(yourSettingIcon),
          ),
        ],
      ),
    );
  }
}
