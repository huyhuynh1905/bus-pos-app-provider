import 'package:bus_pos_app/shared/components/text/text_component.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class TextDefault extends TextComponent{
  TextDefault({
    super.key,
    required String text,
    Color? textColor,
    FontWeight? fontWeight,
    TextAlign? textAlign
  }) : super(
    textValue: text,
    style: Styles.textStyleContent.copyWith(
      color: textColor??AppThemesColors.current.onSurface,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign
  );

}