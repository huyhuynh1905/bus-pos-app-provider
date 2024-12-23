import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:flutter/material.dart';

class UBackgroundBorderShape extends StatelessWidget {
  final Widget childWidget;
  const UBackgroundBorderShape({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.borderRadiusButton),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(800),
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
