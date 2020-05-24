import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yazlab/HomePage.dart';
import 'package:yazlab/components/IconWidget.dart';
import 'package:yazlab/components/LetterWidget.dart';
import 'package:yazlab/components/mainButtons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:yazlab/components/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HighScorePage.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    letters.clear();
    indexes.clear();
    clue = 1;
    updateLetters();
    getLetters_and_indexes();
    alert = DateTime.now().add(Duration(seconds: 10));
  }

  DateTime alert;
  bool checkAns = false;
  bool _showTimer = true;
  int _seconds = 180;
  Duration animationTime = new Duration(seconds: 2);
  Color bottomBarColor = Color(0xff00adb5);
  Color topBarColor = Color(0xff00adb5);
  Color mainBarColor = Color(0xff00adb5);
  Color tempColor = Color(0xff00adb5);
  int pageIndex = 1;
  int tempScore = 0;

  saveLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('savLev', level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff393e46),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(
                        Icons.chevron_left,
                        size: 40.0,
                        color: Color(0xffeeeeee),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HighScorePage()));
                        },
                        child: Icon(Icons.format_list_numbered,
                            color: Color(0xffeeeeee))),
                  ],
                ),
                color: Color(0xff393e46),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Color(0xffeeeeee),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: topBarColor,
                        ),
                        alignment: AlignmentDirectional.center,
                        child: AnimatedContainer(
                          height: 30,
                          color: pageIndex == 1 ? tempColor : mainBarColor,
                          duration: Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconWidget(
                                icons: Icons.videogame_asset,
                                text: ' Lvl : $level ',
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print("Later");
                                  });
                                },
                                child: CountDown(
                                  seconds: _seconds,
                                  onTimer: () {
                                    setState(() {
                                      _showTimer = false;
                                      score -= 100;
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Sure bitti",
                                        style: AlertStyle(
                                            backgroundColor: Colors.white),
                                        desc: "Bölümü geçemedin!",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "Ana Menü",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage()));
                                            },
                                            color: Colors.grey[600],
                                          ),
                                          DialogButton(
                                            child: Text(
                                              "Tekrar Oyna",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              map = generateMap(
                                                  getAllCoords(level));
                                              Navigator.pop(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GamePage()));
                                            },
                                            color: Color(0xff222831),
                                          )
                                        ],
                                      ).show();
                                    });
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    score = 0;
                                    wroteBefore.removeRange(
                                        0, wroteBefore.length);
                                    map = generateMap(getAllCoords(level));
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GamePage()));
                                  });
                                },
                                child: IconWidget(
                                  icons: Icons.refresh,
                                  text: " Reload ",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 250.0,
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          children: List.generate(map.length, (index) {
                            return LetterWidget(
                                text: map[index].text, color: map[index].color);
                          }),
                        ),
                      ),
                      // Reload and tip button
                      Container(
                        height: 30.0,
                        decoration: BoxDecoration(color: bottomBarColor),
                        alignment: AlignmentDirectional.center,
                        child: AnimatedContainer(
                          height: 30,
                          color: pageIndex == 1 ? tempColor : mainBarColor,
                          duration: Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconWidget(
                                icons: Icons.functions,
                                text: "Score : $score",
                              ),
                              Text(
                                currentText,
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    getClue();
                                  });
                                },
                                child: IconWidget(
                                  icons: Icons.fingerprint,
                                  text: "Clue : $clue",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    mainButtons(
                      onPress: () {
                        setState(() {
                          if (color1 == activatedColor) {
                            color1 = disabledColor;
                            currentText = currentText.substring(
                                0, currentText.length - 1);
                          } else {
                            color1 = activatedColor;
                            currentText += letter3;
                          }
                        });
                      },
                      letter: letter3,
                      color: color1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              disableAllColors();
                              currentText = "";
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffe23e57),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: Center(
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color2 == activatedColor) {
                                color2 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color2 = activatedColor;
                                currentText += letter5;
                              }
                            });
                          },
                          letter: letter5,
                          color: color2,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color3 == activatedColor) {
                                color3 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color3 = activatedColor;
                                currentText += letter2;
                              }
                            });
                          },
                          letter: letter2,
                          color: color3,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await saveLevel();
                            print(lastLevel);
                            print(level);
                            await getHscores();
                            await saveHighScore();
                            tempScore = score;
                            setState(() {
                              checkAns = checkAnswer(currentText);
                              if (barColour == 1) {
                                tempColor = Colors.green;
                              }
                              if (barColour == 2) {
                                tempColor = Colors.red;
                              }
                            });
                            if (checkAns) {
                              print(highScoreLevel1);
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "Tebrikler",
                                style:
                                    AlertStyle(backgroundColor: Colors.white),
                                desc:
                                    'Skorunuz:$tempScore En Yuksek Skor: $highScoreLevel1',
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Tekrar Oyna",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      map = generateMap(getAllCoords(level));
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GamePage()));
                                    },
                                    color: Colors.grey[600],
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "Yeni Bolum",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      level++;
                                      map = generateMap(getAllCoords(level));
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GamePage()));
                                    },
                                    color: Color(0xff222831),
                                  )
                                ],
                              ).show();
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff00bdaa),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                )),
                            child: Center(
                              child: Icon(Icons.check),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color4 == activatedColor) {
                                color4 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color4 = activatedColor;
                                currentText += letter4;
                              }
                            });
                          },
                          letter: letter4,
                          color: color4,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        mainButtons(
                          onPress: () {
                            setState(() {
                              if (color5 == activatedColor) {
                                color5 = disabledColor;
                                currentText = currentText.substring(
                                    0, currentText.length - 1);
                              } else {
                                color5 = activatedColor;
                                currentText += letter1;
                              }
                            });
                          },
                          letter: letter1,
                          color: color5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveHighScore() async {
    saveHsFunc(1, highScoreLevel1);
    saveHsFunc(2, highScoreLevel2);
    saveHsFunc(3, highScoreLevel3);
    saveHsFunc(4, highScoreLevel4);
    saveHsFunc(5, highScoreLevel5);
    saveHsFunc(6, highScoreLevel6);
    saveHsFunc(7, highScoreLevel7);
    saveHsFunc(8, highScoreLevel8);
    saveHsFunc(9, highScoreLevel9);
    saveHsFunc(10, highScoreLevel10);
    saveHsFunc(11, highScoreLevel11);
    saveHsFunc(12, highScoreLevel12);
    saveHsFunc(13, highScoreLevel13);
    saveHsFunc(14, highScoreLevel14);
    saveHsFunc(15, highScoreLevel15);
  }

  saveHsFunc(int currLevel, int hScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (level == currLevel) {
      if (score >= hScore) {
        hScore = score;
        await prefs.setInt('highScore$currLevel', hScore);
      }
    }
  }

  getHscores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 16; i++) {
      if (i == 1) {
        highScoreLevel1 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 2) {
        highScoreLevel2 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 3) {
        highScoreLevel3 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 4) {
        highScoreLevel4 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 5) {
        highScoreLevel5 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 6) {
        highScoreLevel6 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 7) {
        highScoreLevel7 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 8) {
        highScoreLevel8 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 9) {
        highScoreLevel9 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 10) {
        highScoreLevel10 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 11) {
        highScoreLevel11 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 12) {
        highScoreLevel12 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 13) {
        highScoreLevel13 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 14) {
        highScoreLevel14 = (prefs.getInt('highScore$i') ?? 0);
      } else if (i == 15) {
        highScoreLevel15 = (prefs.getInt('highScore$i') ?? 0);
      }
    }
  }
}
