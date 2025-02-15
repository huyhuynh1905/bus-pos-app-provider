import 'package:bus_pos_app/shared/components/button/button_component.dart';
import 'package:flutter/material.dart';

class ButtonGradient extends ButtonComponent{
  const ButtonGradient({
    super.key,
    required super.title,
    required super.action,
    required Gradient gradient,
    super.height
  }) : super(
    isGrad: true,
    gradientColor: gradient
  );
}
