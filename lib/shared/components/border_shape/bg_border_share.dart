import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class ContainerComponent extends StatelessWidget {
  final Widget childWidget;
  const ContainerComponent({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.size_10),
      decoration: BoxDecoration(
        color: AppThemesColors.current.tertiaryContainer,
        borderRadius: BorderRadius.circular(Dimens.borderRadiusButton),
        boxShadow: [
          BoxShadow(
            color: AppThemesColors.current.shadow.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 3),
            spreadRadius: 1,
          )
        ],
      ),
      child: childWidget,
    );
  }
}
