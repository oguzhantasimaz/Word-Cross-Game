import 'package:flutter/material.dart';

class mainButtons extends StatelessWidget {
  mainButtons({@required this.letter, this.color, @required this.onPress});
  String letter = "";
  Color color = Colors.white;
  Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
