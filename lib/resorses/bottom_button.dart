import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.title,
    required this.onPress,
  });
  final String title;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
        color: cBottomColor,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 19.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
