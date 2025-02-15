import 'package:bus_pos_app/shared/components/text/text_component.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class TextSubContent extends TextComponent{
  TextSubContent({
    super.key,
    required String text,
    Color? textColor,
    int? maxLines
  }) : super(
    textValue: text,
    style: Styles.textStyleSmall.copyWith(
      color: textColor??AppThemesColors.current.onSurface,
    ),
    maxLines: maxLines
  );

}