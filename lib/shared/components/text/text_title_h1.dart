import 'package:flutter/material.dart';

class UTextTitleH1 extends StatelessWidget {
  final String textValue;
  final Color textColor;
  final double fontSize;

  const UTextTitleH1({
    super.key,
    required this.textValue,
    required this.textColor,
    this.fontSize = 18.0,
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
