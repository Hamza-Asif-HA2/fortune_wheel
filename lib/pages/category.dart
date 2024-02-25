// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/Wheel.dart';
import 'package:fortune_wheel/pages/wallpaper.dart';
import 'package:fortune_wheel/util/popularCategory.dart';

//import 'package:fortune_wheel/util/wallpaper_itself.dart';
import 'package:google_fonts/google_fonts.dart';

class WallpaperCategory extends StatelessWidget {
  const WallpaperCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 200),
        color: Colors.grey.shade200,
        items: [
          Icon(Icons.play_arrow_outlined),
          Icon(Icons.image),
          Icon(Icons.category),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wheel()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Wallpaper(
                            balance: 0,
                          )));
              break;
            default:
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          'All Categories',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'Popular',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            flex: 4,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Popular(
                    name1: 'City',
                    image1: 'images/city.jpg',
                    name2: 'Motivation',
                    image2: 'images/motivation.jpg'),
                Popular(
                    name1: 'Mountains',
                    image1: 'images/mountainss.jpg',
                    name2: 'Flowers',
                    image2: 'images/los.jpg'),
                Popular(
                    name1: 'House',
                    image1: 'images/house.jpg',
                    name2: 'Nature',
                    image2: 'images/trees.jpg'),
                Popular(
                    name1: 'Trees',
                    image1: 'images/los.jpg',
                    name2: 'Forests',
                    image2: 'images/mountainss.jpg'),
                Popular(
                    name1: 'City',
                    image1: 'images/city.jpg',
                    name2: 'Motivation',
                    image2: 'images/motivation.jpg'),
                Popular(
                    name1: 'Mountains',
                    image1: 'images/mountainss.jpg',
                    name2: 'Flowers',
                    image2: 'images/los.jpg'),
                Popular(
                    name1: 'House',
                    image1: 'images/house.jpg',
                    name2: 'Nature',
                    image2: 'images/trees.jpg'),
                Popular(
                    name1: 'Trees',
                    image1: 'images/los.jpg',
                    name2: 'Forests',
                    image2: 'images/mountainss.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
