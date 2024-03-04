// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fortune_wheel/pages/category.dart';
import 'package:fortune_wheel/pages/wallpaper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rxdart/rxdart.dart';

import 'Setting.dart';
import 'marketPlace.dart';

class Wheel extends StatefulWidget {
  Wheel({super.key});

  @override
  State<Wheel> createState() => _WheelState();
}

final selected = BehaviorSubject<int>();

class _WheelState extends State<Wheel> {
  int currentIndex = 0, rewards = 0, balance = 0, tries = 5, points = 5;
  bool animate = false;

  List<int> numbers = [50, 100, 500, 1000, 2000, 5000, 10000, 50000];
  List<int> point = [1, 2, 3, 4, 5, 6, 7, 8];

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

  void resetAll(bool reset) {
    if (reset) {
      tries = 5;
      rewards = 0;
      balance = 0;
      points = 0;
      animate = false;
    }
  }

  @override
  void dispose() {
    //selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade300,
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
              if (currentIndex != 0) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Wheel()));
                currentIndex = 0;
              }
              break;
            case 1:
              if (balance >= 10000) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Wallpaper(
                      balance: balance,
                    ),
                  ),
                );
                currentIndex = 1;
                break;
              } else {
                currentIndex = 0;
              }
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WallpaperCategory()));
              currentIndex = 2;
              break;
            default:
          }
        },
        index: currentIndex,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settingPage()));
              },
              child: Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      color: Colors.grey[300],
                      boxShadow: shadow,
                    ),
                    child: Text(
                      'Points: ${points}',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Time to Roll the Dice and See What Luck Has in Store for You!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: shadow,
                shape: BoxShape.circle,
              ),
              height: 250,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  FortuneWheel(
                    styleStrategy: UniformStyleStrategy(),
                    animateFirst: animate,
                    selected: selected.stream,
                    items: [
                      for (int i = 0; i < numbers.length; i++) ...<FortuneItem>{
                        FortuneItem(
                          style: FortuneItemStyle(
                            color: i % 2 == 0
                                ? Colors.white
                                : Colors.grey.shade300,
                            borderColor: Colors.white,
                            borderWidth: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${numbers[i]}',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: LottieBuilder.network(
                                  "https://lottie.host/764a8e34-a26e-4967-a115-73530693de3a/XtcKcLCLgO.json",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      },
                    ],
                    onAnimationEnd: () {
                      setState(
                        () {
                          rewards = numbers[selected.value];
                          balance = balance + numbers[selected.value];
                          points = points + point[selected.value];
                          tries--;
                          animate = false;
                        },
                      );

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Congratulations!',
                              style: GoogleFonts.bebasNeue(
                                fontSize: 30,
                              ),
                            ),
                            content: Text(
                              'You just won $rewards points.',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Positioned(
                    bottom: 100,
                    child: GestureDetector(
                      onTap: () {
                        if (tries > 0) {
                          animate = true;
                          setState(() {
                            selected.add(
                              Fortune.randomInt(0, numbers.length),
                            );
                          });
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 150,
                                width: 150,
                                child: AlertDialog(
                                  backgroundColor: Colors.grey[300],
                                  title: Text(
                                    'Ooopss.... ;(',
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 30,
                                    ),
                                  ),
                                  content: Text(
                                    'You have Zero Tries :(',
                                    style: GoogleFonts.bebasNeue(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          boxShadow: shadow,
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                            color: Colors.grey[300],
                            boxShadow: shadow,
                          ),
                          child: Text(
                            'Balance: ${balance}',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 30,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                            color: Colors.grey[300],
                            boxShadow: shadow,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'Tries: ${tries}',
                              style: GoogleFonts.bebasNeue(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        resetAll(true);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        boxShadow: shadow,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          25.0,
                        ),
                        child: Text(
                          'Reset All',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (balance >= 10000) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wallpaper(
                                balance: balance,
                              ),
                            ));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 150,
                              width: 150,
                              child: AlertDialog(
                                backgroundColor: Colors.grey[300],
                                title: Text(
                                  'Ooopss.... ;(',
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 30,
                                  ),
                                ),
                                content: Text(
                                  'Balance is less than 10k:(',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      // setState(() {
                      //   resetAll(true);
                      // });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: shadow,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Unlock Wallpapers',
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => marketPlace(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: shadow,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Market Place',
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.shop_2_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
