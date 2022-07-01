import 'package:flutter/material.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? buttonLabel;

  BottomButton({@required this.buttonLabel, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(
          buttonLabel!,
          style: kCalulateButton,
          textAlign: TextAlign.center,
        ),
        color: Colors.pinkAccent,
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
