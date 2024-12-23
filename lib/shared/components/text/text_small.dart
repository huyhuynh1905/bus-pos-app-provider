import 'package:flutter/material.dart';

class UTextSmall extends StatelessWidget {
  final String textValue;
  final Color textColor;
  final double fontSize;

  const UTextSmall({
    super.key,
    required this.textValue,
    required this.textColor,
    this.fontSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    );
  }
}
