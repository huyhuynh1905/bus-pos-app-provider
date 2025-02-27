import 'package:bus_pos_app/shared/components/button/button_component.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';

class ButtonOutline extends ButtonComponent{
  ButtonOutline({
    super.key,
    required super.title,
    required super.action,
    super.borderColor,
    super.height
  }) : super(
    isOutline: true,
    textColor: AppThemesColors.current.onSurface
  );
}
