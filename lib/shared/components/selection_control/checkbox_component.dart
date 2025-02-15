import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class CheckboxComponent extends StatelessWidget {
  final String value;
  final bool isChecked;

  final ValueChanged<bool?> onChanged;

  final Color? activeColor;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? checkColor;
  final Color? overlayColor;
  final Color? disableColor;
  final double? splashRadius;
  final bool isDisable;
  final TextStyle? valueStyle;

  const CheckboxComponent({
    super.key,
    required this.value,
    required this.isChecked,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.disableColor,
    this.splashRadius = Dimens.spasPadding,
    this.isDisable = false,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isDisable ? null : onChanged(!isChecked),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Container(
          child: Row(
            children: [
              _customRadioButton,
              TextDefault(
                text: value,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    return Checkbox(
      value: isChecked,
      checkColor: checkColor??AppThemesColors.current.onPrimary,
      activeColor: isDisable ? disableColor??AppThemesColors.current.outlineVar : activeColor??AppThemesColors.current.primary,
      // fillColor: MaterialStateProperty.all(isDisable ? disableColor : fillColor),
      focusColor: focusColor??AppThemesColors.current.primary,
      hoverColor: hoverColor??AppThemesColors.current.primaryContainer,
      overlayColor: MaterialStateProperty.all(overlayColor),
      splashRadius: splashRadius,
      onChanged: isDisable ? null : (newValue) {
        onChanged(newValue);
      },
    );
  }
}
