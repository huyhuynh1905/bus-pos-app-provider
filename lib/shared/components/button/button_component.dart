import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:bus_pos_app/shared/utils/supports.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Function action;
  final double borderRadius;
  final double height;
  final double? width;
  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final bool isDisable;
  final bool isOutline;
  final bool isGrad;
  final Gradient? gradientColor;

  const ButtonComponent({
    super.key,
    required this.title,
    required this.action,
    this.textColor,
    this.borderRadius = 5,
    this.height = Dimens.size_45,
    this.width,
    this.isDisable = false,
    this.isOutline = false,
    this.isGrad = false,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.gradientColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isGrad ? null : isOutline ? AppThemesColors.current.surface : isDisable ? disableBackgroundColor??AppThemesColors.current.outlineVar : backgroundColor??AppThemesColors.current.primary,
        borderRadius: BorderRadius.circular(borderRadius),
        border: isGrad ? null : isOutline ? Border.all(color: AppThemesColors.current.primary) : null,
        gradient: gradientColor
      ),
      child: ElevatedButton(
        onPressed: () {
          hideKeyBoard(context);
          if(!isDisable) action();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: AppThemesColors.current.primaryContainer,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spaXsPadding
          )
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: TextDefault(
            text: title,
            textColor: isOutline ? AppThemesColors.current.onSurface : textColor ?? AppThemesColors.current.onPrimary,
          ),
        ),
      ),
    );
  }
}