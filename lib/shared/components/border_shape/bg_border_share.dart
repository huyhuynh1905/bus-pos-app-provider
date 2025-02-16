import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class ContainerComponent extends StatelessWidget {
  final Widget childWidget;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const ContainerComponent({
    super.key,
    required this.childWidget,
    this.margin,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding??const EdgeInsets.all(Dimens.contentPaddingSmaller),
      margin: margin??const EdgeInsets.all(Dimens.contentPaddingHoz),
      decoration: BoxDecoration(
        color: AppThemesColors.current.tertiaryContainer,
        borderRadius: BorderRadius.circular(Dimens.borderRadiusButton),
        boxShadow: [
          BoxShadow(
            color: AppThemesColors.current.shadow.withOpacity(0.05),
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
