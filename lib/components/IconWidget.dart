import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icons;
  final Color color;
  final double size;
  final String text;
  const IconWidget(
      {Key key, this.icons, @required this.text, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 5.0,
        ),
        Icon(
          this.icons,
          size: this.size,
          color: this.color,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          this.text,
          style: TextStyle(color: this.color),
        ),
        SizedBox(
          width: 5.0,
        ),
      ],
    );
  }
}
