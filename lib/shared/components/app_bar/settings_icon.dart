import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:flutter/material.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    return GestureDetector(
      onTap: (){
        //đi đến màn hình settings
        customLog("SettingsIcon => click");
        Navigator.pushNamed(context, RouteConstant.settingsScreen);
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(Dimens.spaXxsPadding),
        child: Icon(
          Icons.settings,
          color: AppThemesColors.current.onPrimary,
        ),
      ),
    );
  }
}
