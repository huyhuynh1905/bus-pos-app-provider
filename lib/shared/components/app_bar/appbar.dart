import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/shared/components/text/text_title.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';


class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Function? actionBack;
  bool showIconBack;
  bool isHasShadow;
  Widget? rightIcon;

  Appbar({
    super.key,
    required this.title,
    this.actionBack,
    this.titleColor,
    this.showIconBack = true,
    this.isHasShadow = true,
    this.rightIcon
  });

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    debugPrint("Appbar ==================> ${getIt<AppProvider>().isDarkThemes}");
    return Container(
      decoration: BoxDecoration(
        color: AppThemesColors.current.primary,
        boxShadow: [
          if(isHasShadow) BoxShadow(
            color: AppThemesColors.current.shadow.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: Dimens.topPadding,
        bottom: Dimens.spasPadding,
        left: Dimens.spaMPadding,
        right: Dimens.spaMPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showIconBack == true)
                  Padding(
                    padding: const EdgeInsets.only(left: Dimens.size_10, top: Dimens.size_3, bottom: Dimens.size_3),
                    child: GestureDetector(
                      onTap: () {
                        try{
                          actionBack!();
                        } catch(e){
                          //
                        }
                        Navigator.maybePop(context);
                      },
                      child: Assets.svgs.iconBackToolbar.svg(color: titleColor??AppThemesColors.current.onPrimary, )
                    ),
                  ),
                const SizedBox(width: 20),
                TextTitle(
                  textColor: titleColor??AppThemesColors.current.onPrimary,
                  text: title,
                ),
              ],
            ),
          ),

          //right
          rightIcon!=null ?
              rightIcon!
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
