import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class RadioComponent extends StatelessWidget {
  final String value;
  final String groupValue;

  final ValueChanged<String?> onChanged;

  final Color? activeColor;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? overlayColor;
  final Color? disableColor;
  final double? splashRadius;
  final bool isDisable;
  final TextStyle? valueStyle;

  const RadioComponent({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor,
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
      onTap: () => isDisable ? null : onChanged(value),
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
    return Radio(
      value: value,
      groupValue: groupValue,
      activeColor: isDisable ? disableColor??AppThemesColors.current.outlineVar : activeColor??AppThemesColors.current.primary,
      fillColor: MaterialStateProperty.all(isDisable ? disableColor : fillColor??AppThemesColors.current.primary),
      focusColor: focusColor??AppThemesColors.current.primary,
      hoverColor: hoverColor??AppThemesColors.current.primaryContainer,
      overlayColor: MaterialStateProperty.all(overlayColor??AppThemesColors.current.primaryContainer),
      splashRadius: splashRadius,
      onChanged: isDisable ? null : (String? newValue) {
        onChanged(newValue);
      },
    );
  }
}
