import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final Function()? gesture;

  Reusable({this.colour, this.cardChild, this.gesture});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gesture,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
