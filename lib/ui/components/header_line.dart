import 'package:flutter/material.dart';

class HeaderLine extends StatelessWidget {
  final String text;
  HeaderLine({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
