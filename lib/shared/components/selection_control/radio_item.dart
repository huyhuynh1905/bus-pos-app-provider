import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final String value;
  final String groupValue;

  final ValueChanged<String?> onChanged;

  final Color activeColor;
  final Color fillColor;
  final Color focusColor;
  final Color hoverColor;
  final Color overlayColor;
  final Color disableColor;
  final double? splashRadius;
  final bool isDisable;
  final TextStyle? valueStyle;

  const RadioItem({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor = AppColors.primaryColor,
    this.fillColor = AppColors.primaryColor,
    this.focusColor = AppColors.primaryColor,
    this.hoverColor = AppColors.redPrimaryA9,
    this.overlayColor = AppColors.redPrimaryA9,
    this.disableColor = AppColors.greyColor,
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
              Text(
                value,
                style: valueStyle??Styles.textStyleSubTitle,
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
      activeColor: isDisable ? disableColor : activeColor,
      fillColor: MaterialStateProperty.all(isDisable ? disableColor : fillColor),
      focusColor: focusColor,
      hoverColor: hoverColor,
      overlayColor: MaterialStateProperty.all(overlayColor),
      splashRadius: splashRadius,
      onChanged: isDisable ? null : (String? newValue) {
        onChanged(newValue);
      },
    );
  }
}
