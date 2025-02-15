import 'package:bus_pos_app/shared/components/text/text_component.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class TextTitle extends TextComponent{
  TextTitle({
    super.key,
    required String text,
    Color? textColor,
    FontWeight? fontWeight
  }) : super(
    textValue: text,
    style: Styles.textStyleTitle.copyWith(
      color: textColor??AppThemesColors.current.primary,
      fontWeight: fontWeight
    )
  );

}