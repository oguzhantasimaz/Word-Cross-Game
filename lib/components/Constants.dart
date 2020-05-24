import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yazlab/components/LetterWidget.dart';
import 'package:yazlab/components/LevelMaps.dart';
import 'package:shared_preferences/shared_preferences.dart';

int highScoreLevel1 = 1;
int highScoreLevel2 = 1;
int highScoreLevel3 = 1;
int highScoreLevel4 = 1;
int highScoreLevel5 = 1;
int highScoreLevel6 = 1;
int highScoreLevel7 = 1;
int highScoreLevel8 = 1;
int highScoreLevel9 = 1;
int highScoreLevel10 = 1;
int highScoreLevel11 = 1;
int highScoreLevel12 = 1;
int highScoreLevel13 = 1;
int highScoreLevel14 = 1;
int highScoreLevel15 = 1;

Random random = Random();
randomListItem(List lst) => lst[random.nextInt(lst.length)];
String currentText = "";
int level = 1;
int lastLevel;
var clue = 20; //1 yesil 2 kirmizi
int score = 0;
Color color1 = Colors.white;
Color color2 = Colors.white;
Color color3 = Colors.white;
Color color4 = Colors.white;
Color color5 = Colors.white;
String letter1 = "";
String letter2 = "";
String letter3 = "";
String letter4 = "";
String letter5 = "";
const Color disabledColor = Colors.white;
const Color activatedColor = Color(0xff00adb5);

List<String> wroteBefore = List<String>();
List<LetterWidget> map = generateMap(getAllCoords(level));
Map<String, String> wordMap;
int barColour = 0; // 1yesil 2 kirmizi

bool checkAnswer(String answer) {
  print(indexes);
  checkLevel();

  for (int i = 0; i < wroteBefore.length; i++) {
    if (wroteBefore[i] == answer) {
      color1 = disabledColor;
      color2 = disabledColor;
      color3 = disabledColor;
      color4 = disabledColor;
      color5 = disabledColor;
      currentText = "";
      return false;
    }
  }
  List<String> answerList = answer.split("");
  List<int> conversionList = convertList(answer, level);
  disableAllColors();
  if (conversionList.length != 0) {
    score += 50;
    color1 = disabledColor;
    color2 = disabledColor;
    color3 = disabledColor;
    color4 = disabledColor;
    color5 = disabledColor;
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < conversionList.length; j++) {
        if (i == conversionList[j]) {
          map[i] = LetterWidget(text: answerList[j], color: Color(0xff00bdaa));
          activeIndexes = activeIndexes.toSet().toList();
          activeIndexes.remove(conversionList[j]);
          j = conversionList.length - 1;
        }
      }
    }
    print("active:");
    print(activeIndexes);
    wroteBefore.add(answer);
    barColour = 1;
  } else {
    barColour = 2;
    score -= 10;
    color1 = disabledColor;
    color2 = disabledColor;
    color3 = disabledColor;
    color4 = disabledColor;
    color5 = disabledColor;
    currentText = "";
    return false;
  }
  if (wroteBefore.length >= wordMap.length) {
    score = 0;
    wroteBefore.removeRange(0, wroteBefore.length);
    return true;
    //NEXT STAGE
  } else {
    return false;
  }
}

void disableAllColors() {
  currentText = "";
  color1 = Colors.white;
  color2 = Colors.white;
  color3 = Colors.white;
  color4 = Colors.white;
  color5 = Colors.white;
}

List<String> letters = List<String>();
List<int> indexes = List<int>();
List<int> activeIndexes = List<int>();

List<int> getAllCoords(int level) {
  checkLevel();
  List<int> coords = List<int>();
  for (int i = 0; i < wordMap.values.toList().length; i++) {
    var values = wordMap.values.toList()[i].split(",");

    for (var value in values) {
      coords.add(int.parse(value));
    }
  }
  return coords;
}

List<int> convertList(String word, int level) {
  checkLevel();
  List<String> coords_string = List<String>();
  List<int> coords = List<int>();
  for (int i = 0; i < wordMap.length; i++) {
    if (wordMap[word] != null) {
      coords_string = wordMap[word].split(",");
      i = wordMap.length - 1;
    }
  }
  for (int i = 0; i < coords_string.length; i++) {
    coords.add(int.parse(coords_string[i]));
  }
  return coords;
}

List<LetterWidget> generateMap(List<int> coords) {
  List<LetterWidget> map = List<LetterWidget>();

  for (int i = 0; i < 36; i++) {
    LetterWidget _newWidget;
    for (int j = 0; j < coords.length; j++) {
      if (i == coords[j]) {
        _newWidget = LetterWidget(text: "", color: Color(0xff393e46));
        j = coords.length - 1;
      } else {
        _newWidget = LetterWidget(text: "", color: Color(0xffeeeeee));
      }
    }
    map.add(_newWidget);
  }
  return map;
}

void getLetters_and_indexes() {
  checkLevel();
  for (int i = 0; i < wordMap.keys.toList().length; i++) {
    List<String> word = wordMap.keys.toList()[i].split("");
    for (int j = 0; j < word.length; j++) {
      letters.add(word[j]);
    }
  }
  for (int i = 0; i < wordMap.values.toList().length; i++) {
    List<String> index = wordMap.values.toList()[i].split(",");
    for (int j = 0; j < index.length; j++) {
      indexes.add(int.parse(index[j]));
    }
  }

  activeIndexes = indexes;
  print(letters);
  print(indexes);
}

void getClue() {
  if (clue > 0) {
    int rand = randomListItem(activeIndexes);
    print(rand);
    for (int i = 0; i < indexes.length; i++) {
      if (indexes[i] == rand) {
        for (int j = 0; j < map.length; j++) {
          if (j == rand && map[j].text == "") {
            map[j] = LetterWidget(text: letters[i], color: Color(0xff00bdaa));
            activeIndexes = activeIndexes.toSet().toList();
            activeIndexes.remove(rand);
            clue--;
          }
        }
        i = indexes.length - 1;
      }
    }

    print(activeIndexes);
  } else {
    print("no");
  }
}

void updateLetters() {
  if (level == 1) {
    letter1 = mapLetter1[0];
    letter2 = mapLetter1[1];
    letter3 = mapLetter1[2];
    letter4 = mapLetter1[3];
    letter5 = mapLetter1[4];
  } else if (level == 2) {
    letter1 = mapLetter2[0];
    letter2 = mapLetter2[1];
    letter3 = mapLetter2[2];
    letter4 = mapLetter2[3];
    letter5 = mapLetter2[4];
  } else if (level == 3) {
    letter1 = mapLetter3[0];
    letter2 = mapLetter3[1];
    letter3 = mapLetter3[2];
    letter4 = mapLetter3[3];
    letter5 = mapLetter3[4];
  } else if (level == 4) {
    letter1 = mapLetter4[0];
    letter2 = mapLetter4[1];
    letter3 = mapLetter4[2];
    letter4 = mapLetter4[3];
    letter5 = mapLetter4[4];
  } else if (level == 5) {
    letter1 = mapLetter5[0];
    letter2 = mapLetter5[1];
    letter3 = mapLetter5[2];
    letter4 = mapLetter5[3];
    letter5 = mapLetter5[4];
  } else if (level == 6) {
    letter1 = mapLetter6[0];
    letter2 = mapLetter6[1];
    letter3 = mapLetter6[2];
    letter4 = mapLetter6[3];
    letter5 = mapLetter6[4];
  } else if (level == 7) {
    letter1 = mapLetter7[0];
    letter2 = mapLetter7[1];
    letter3 = mapLetter7[2];
    letter4 = mapLetter7[3];
    letter5 = mapLetter7[4];
  } else if (level == 8) {
    letter1 = mapLetter8[0];
    letter2 = mapLetter8[1];
    letter3 = mapLetter8[2];
    letter4 = mapLetter8[3];
    letter5 = mapLetter8[4];
  } else if (level == 9) {
    letter1 = mapLetter9[0];
    letter2 = mapLetter9[1];
    letter3 = mapLetter9[2];
    letter4 = mapLetter9[3];
    letter5 = mapLetter9[4];
  } else if (level == 10) {
    letter1 = mapLetter10[0];
    letter2 = mapLetter10[1];
    letter3 = mapLetter10[2];
    letter4 = mapLetter10[3];
    letter5 = mapLetter10[4];
  } else if (level == 11) {
    letter1 = mapLetter11[0];
    letter2 = mapLetter11[1];
    letter3 = mapLetter11[2];
    letter4 = mapLetter11[3];
    letter5 = mapLetter11[4];
  } else if (level == 12) {
    letter1 = mapLetter12[0];
    letter2 = mapLetter12[1];
    letter3 = mapLetter12[2];
    letter4 = mapLetter12[3];
    letter5 = mapLetter12[4];
  } else if (level == 13) {
    letter1 = mapLetter13[0];
    letter2 = mapLetter13[1];
    letter3 = mapLetter13[2];
    letter4 = mapLetter13[3];
    letter5 = mapLetter13[4];
  } else if (level == 14) {
    letter1 = mapLetter14[0];
    letter2 = mapLetter14[1];
    letter3 = mapLetter14[2];
    letter4 = mapLetter14[3];
    letter5 = mapLetter14[4];
  } else if (level == 15) {
    letter1 = mapLetter15[0];
    letter2 = mapLetter15[1];
    letter3 = mapLetter15[2];
    letter4 = mapLetter15[3];
    letter5 = mapLetter15[4];
  }
}

void checkLevel() {
  if (level == 1) {
    wordMap = wordsMap1;
  } else if (level == 2) {
    wordMap = wordsMap2;
  } else if (level == 3) {
    wordMap = wordsMap3;
  } else if (level == 4) {
    wordMap = wordsMap4;
  } else if (level == 5) {
    wordMap = wordsMap5;
  } else if (level == 6) {
    wordMap = wordsMap6;
  } else if (level == 7) {
    wordMap = wordsMap7;
  } else if (level == 8) {
    wordMap = wordsMap8;
  } else if (level == 9) {
    wordMap = wordsMap9;
  } else if (level == 10) {
    wordMap = wordsMap10;
  } else if (level == 11) {
    wordMap = wordsMap11;
  } else if (level == 12) {
    wordMap = wordsMap12;
  } else if (level == 13) {
    wordMap = wordsMap13;
  } else if (level == 14) {
    wordMap = wordsMap14;
  } else if (level == 15) {
    wordMap = wordsMap15;
  }
}
