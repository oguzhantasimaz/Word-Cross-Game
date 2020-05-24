import 'package:flutter/material.dart';

class LetterWidget extends StatelessWidget {
  final String text;
  final Color color;

  const LetterWidget({Key key, this.text, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            left: Radius.elliptical(3, 3), right: Radius.elliptical(3, 3)),
        color: this.color,
      ),
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
