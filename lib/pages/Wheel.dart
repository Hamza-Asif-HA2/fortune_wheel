// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rxdart/rxdart.dart';

class Wheel extends StatefulWidget {
  Wheel({super.key});

  @override
  State<Wheel> createState() => _WheelState();
}

final selected = BehaviorSubject<int>();

class _WheelState extends State<Wheel> {

  int rewards = 0;
  int balance = 0;
  int tries = 5;
  bool animate = false;
  int points = 5;
  List<int> numbers = [
    50,
    100,
    500,
    1000,
    2000,
    5000,
    10000,
    50000,
  ];

  List<int> point = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
  ];

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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
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
                          fontSize: 24,
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
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: shadow,
                  shape: BoxShape.circle,
                ),
                height: 300,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    FortuneWheel(
                      styleStrategy: UniformStyleStrategy(),
                      animateFirst: animate,
                      selected: selected.stream,
                      items: [
                        for (int i = 0;
                            i < numbers.length;
                            i++) ...<FortuneItem>{
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
                      bottom: 119,
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
                            size: 40,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
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
                                  fontSize: 24,
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
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            'Reset All',
                            style: GoogleFonts.bebasNeue(
                              fontSize: 34,
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
      ),
    );
  }
}
