import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class SwitchItem extends StatelessWidget {
  final bool isOn;
  final bool isHasThumb;
  final bool isDisable;
  final ValueChanged<bool> onChanged;
  final MaterialStateProperty<Icon?>? iconThumb;

  final Color? activeTrackColor;
  final Color? activeColor;
  final Color? inactiveTrackColor;
  final Color? inactiveThumbColor;

  SwitchItem({
    super.key,
    required this.isOn,
    required this.onChanged,
    this.isHasThumb = false,
    this.isDisable = false,
    this.iconThumb,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
    this.activeTrackColor,
    this.activeColor,
  });

  ///default
  final MaterialStateProperty<Icon?> thumbIconDefault = MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return _customRadioButton;
  }

  Widget get _customRadioButton {
    return SizedBox(
      height: Dimens.heightSwitch,
      width: Dimens.widthSwitch,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          value: isOn,
          splashRadius: Dimens.size_2,
          activeColor: AppThemesColors.current.onPrimary,
          activeTrackColor: activeTrackColor??AppThemesColors.current.primary,
          inactiveTrackColor: inactiveTrackColor??AppThemesColors.current.surface,
          trackOutlineColor: WidgetStateProperty.resolveWith((final Set<MaterialState> states) {
              if (states.contains(WidgetState.selected)) {
                return AppThemesColors.current.primary;
              }

              return AppThemesColors.current.outline;
            },
          ),
          inactiveThumbColor: isOn ? Colors.white : AppThemesColors.current.outline,
          thumbIcon: isHasThumb ? (iconThumb ?? thumbIconDefault) : null,
          onChanged: isDisable ? null : (bool value) {
            onChanged(value);
          },
        ),
      ),
    );
  }
}
