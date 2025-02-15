import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({
    super.key,
    this.text,
    this.color
  });

  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: color??AppThemesColors.current.primary,
        ),
        const SizedBox(height: Dimens.spasPadding,),
        TextDefault(
          text: text??"",
        )
      ],
    );
  }
}
