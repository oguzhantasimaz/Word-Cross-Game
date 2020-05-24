import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yazlab/components/Constants.dart';
import 'package:yazlab/components/IconWidget.dart';
import 'package:yazlab/screens/GamePage.dart';
import 'package:yazlab/screens/LevelsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String difficulty = '';

  getLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastLevel = prefs.getInt('savLev') ?? 0;
    print(prefs.getInt('savLev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff222831),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "QUIZZLER",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 50,
                    color: Color(0xffeeeeee)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () async {
                          await getLevel();
                          level = 1;
                          setState(() {
                            map = generateMap(getAllCoords(1));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          });
                        },
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          child: Center(
                            child: IconWidget(
                              icons: Icons.play_circle_filled,
                              text: "Easy",
                              size: 40,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff222831),
                          ),
                        )),
                    GestureDetector(
                        onTap: () async {
                          await getLevel();
                          level = 6;
                          setState(() {
                            map = generateMap(getAllCoords(1));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          });
                        },
                        child: Container(
                          width: 120.0,
                          height: 50.0,
                          child: Center(
                            child: IconWidget(
                              icons: Icons.play_circle_filled,
                              text: "Medium",
                              size: 40,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff222831),
                          ),
                        )),
                    GestureDetector(
                        onTap: () async {
                          await getLevel();
                          level = 11;
                          setState(() {
                            map = generateMap(getAllCoords(1));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GamePage()));
                          });
                        },
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          child: Center(
                            child: IconWidget(
                              icons: Icons.play_circle_filled,
                              text: "Hard",
                              size: 40,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff222831),
                          ),
                        )),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LevelsPage()));
                      });
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Center(
                        child: IconWidget(
                          icons: FontAwesomeIcons.map,
                          text: "Levels",
                          size: 25,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff222831),
                      ),
                    )),
                GestureDetector(
                    onTap: () async {
                      await getLevel();
                      level = lastLevel;
                      setState(() {
                        map = generateMap(getAllCoords(1));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      });
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      child: Center(
                        child: IconWidget(
                          icons: FontAwesomeIcons.playCircle,
                          text: "Continue",
                          size: 25,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff222831),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconWidget(
                    icons: FontAwesomeIcons.github,
                    text: "Kaan Tecik",
                    color: Color(0xffeeeeee)),
                IconWidget(
                    icons: FontAwesomeIcons.github,
                    text: "Oğuzhan Taşımaz",
                    color: Color(0xffeeeeee))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
