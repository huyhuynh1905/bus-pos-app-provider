import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:flutter/material.dart';

class UTextNormal extends StatelessWidget {
  final String textValue;
  final Color textColor;
  final double fontSize;

  const UTextNormal({
    super.key,
    required this.textValue,
    this.textColor = AppColors.blackColor,
    this.fontSize = 14.0,
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
