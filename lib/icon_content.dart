import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class reusecard extends StatelessWidget {
  final IconData? maleorf;
  final String? gender;

  reusecard({this.maleorf, this.gender});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          maleorf,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$gender',
          style: kLabelTextstyles,
        ),
      ],
    );
  }
}
