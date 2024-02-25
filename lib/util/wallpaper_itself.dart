import 'package:flutter/material.dart';

class Wallpapers extends StatelessWidget {
  final String Emage;
  final String SecondImage;

  Wallpapers({super.key, required this.Emage, required this.SecondImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(
              2,
            ),
            child: Image.asset(
              Emage,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(
              2,
            ),
            child: Image.asset(
              SecondImage,
            ),
          ),
        ),
      ],
    );
  }
}
