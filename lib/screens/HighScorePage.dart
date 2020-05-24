import 'package:flutter/material.dart';
import 'package:yazlab/components/Constants.dart';

class HighScorePage extends StatefulWidget {
  @override
  _HighScorePageState createState() => _HighScorePageState();
}

class _HighScorePageState extends State<HighScorePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            hsContainer(
              levelGiven: 1,
              highScore: highScoreLevel1,
            ),
            hsContainer(
              levelGiven: 2,
              highScore: highScoreLevel2,
            ),
            hsContainer(
              levelGiven: 3,
              highScore: highScoreLevel3,
            ),
            hsContainer(
              levelGiven: 4,
              highScore: highScoreLevel4,
            ),
            hsContainer(
              levelGiven: 5,
              highScore: highScoreLevel5,
            ),
            hsContainer(
              levelGiven: 6,
              highScore: highScoreLevel6,
            ),
            hsContainer(
              levelGiven: 7,
              highScore: highScoreLevel7,
            ),
            hsContainer(
              levelGiven: 8,
              highScore: highScoreLevel8,
            ),
            hsContainer(
              levelGiven: 9,
              highScore: highScoreLevel9,
            ),
            hsContainer(
              levelGiven: 10,
              highScore: highScoreLevel10,
            ),
            hsContainer(
              levelGiven: 11,
              highScore: highScoreLevel11,
            ),
            hsContainer(
              levelGiven: 12,
              highScore: highScoreLevel12,
            ),
            hsContainer(
              levelGiven: 13,
              highScore: highScoreLevel13,
            ),
            hsContainer(
              levelGiven: 14,
              highScore: highScoreLevel14,
            ),
            hsContainer(
              levelGiven: 15,
              highScore: highScoreLevel15,
            ),
          ],
        ),
      ),
    );
  }
}

class hsContainer extends StatelessWidget {
  final int levelGiven;
  final int highScore;
  hsContainer({@required this.levelGiven, @required this.highScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Center(
        child: Text(
          'Level $levelGiven HighScore = $highScore',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
