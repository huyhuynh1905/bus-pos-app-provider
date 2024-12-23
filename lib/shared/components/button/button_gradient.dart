import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/utils/supports.dart';
import 'package:flutter/material.dart';

class UButtonGradient extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Function action;
  final double borderRadius;
  final double height;
  final double width;
  final Gradient gradientColor;

  const UButtonGradient({
    super.key,
    required this.title,
    required this.action,
    this.titleStyle,
    this.borderRadius = 5,
    this.height = Dimens.size_50,
    this.width = 100,
    this.gradientColor = AppColors.redGradientVertical,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradientColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: () {
          hideKeyBoard(context);
          action();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: AppColors.splashClickColor,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spaXsPadding
          )
        ),
        child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            title,
            style: titleStyle??Styles.textStyleButtonGrad,
          ),
        ),
      ),
    );
  }
}
