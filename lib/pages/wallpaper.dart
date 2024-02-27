// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fortune_wheel/pages/Wheel.dart';
import 'package:fortune_wheel/pages/category.dart';
import 'package:fortune_wheel/util/wallpaper_itself.dart';
import 'package:fortune_wheel/util/wallpaper_theme.dart';

class Wallpaper extends StatelessWidget {
  final int balance;

  Wallpaper({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Color.fromRGBO(105, 105, 105, 0),
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
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WallpaperCategory()));
              break;
            default:
          }
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    WallpaperTheme(
                      theme: 'Nature',
                      iconData: Icons.nature,
                    ),
                    WallpaperTheme(
                      theme: 'Cars',
                      iconData: Icons.car_crash,
                    ),
                    WallpaperTheme(
                      theme: 'Mountain',
                      iconData: Icons.wind_power,
                    ),
                    WallpaperTheme(
                      theme: 'Animals',
                      iconData: Icons.water,
                    ),
                    WallpaperTheme(
                      theme: 'Forest',
                      iconData: Icons.add_box,
                    ),
                    WallpaperTheme(
                      theme: 'Cars',
                      iconData: Icons.bus_alert,
                    ),
                    WallpaperTheme(
                      theme: 'Ocean',
                      iconData: Icons.waves,
                    ),
                    WallpaperTheme(
                      theme: 'Cats',
                      iconData: Icons.gamepad,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Wallpapers(
                        Emage: 'images/sun.jpg',
                        SecondImage: 'images/flower.jpg'),
                    Wallpapers(
                        Emage: 'images/ocean.jpg',
                        SecondImage: 'images/Fields.jpg'),
                    Wallpapers(
                        Emage: 'images/leaf.jpg',
                        SecondImage: 'images/sun.jpg'),
                    Wallpapers(
                        Emage: 'images/sun.jpg',
                        SecondImage: 'images/flower.jpg'),
                    Wallpapers(
                        Emage: 'images/ocean.jpg',
                        SecondImage: 'images/Fields.jpg'),
                    Wallpapers(
                        Emage: 'images/leaf.jpg',
                        SecondImage: 'images/sun.jpg'),
                    Wallpapers(
                        Emage: 'images/sun.jpg',
                        SecondImage: 'images/flower.jpg'),
                    Wallpapers(
                        Emage: 'images/ocean.jpg',
                        SecondImage: 'images/Fields.jpg'),
                    Wallpapers(
                        Emage: 'images/leaf.jpg',
                        SecondImage: 'images/sun.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
