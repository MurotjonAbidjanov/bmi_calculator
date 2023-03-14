import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gender extends StatelessWidget {
  Gender({required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}

class Pages extends StatelessWidget {
  Pages({this.cardChild, required this.tus});
  final cardChild;
  final Color tus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: tus,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
