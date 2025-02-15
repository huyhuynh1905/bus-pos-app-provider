import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String textValue;
  final TextStyle style;
  final TextOverflow? overflow;
  final bool? softWrap;
  final int? maxLines;
  final TextAlign? textAlign;



  TextComponent({
    super.key,
    required this.textValue,
    required this.style,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: style,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
