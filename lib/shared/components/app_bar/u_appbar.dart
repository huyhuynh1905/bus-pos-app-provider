import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/shared/components/text/text_title_h2.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
 * Created by DinhTC on 26/01/2024.
 * Company UNIT
 * Code is not just a tool; it's the art of turning ideas into reality.
 */

class UAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Function? actionBack;
  bool showIconBack;
  bool isHasShadow;

  UAppbar({
    super.key,
    required this.title,
    this.actionBack,
    this.titleColor,
    this.showIconBack = true,
    this.isHasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          if(isHasShadow) BoxShadow(
            color: AppColors.colorShadows.withAlpha(83),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: Dimens.topPadding,
        bottom: Dimens.spasPadding,
        left: Dimens.spaMPadding,
        right: Dimens.spaMPadding,
      ),
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
                child: Assets.svgs.iconBackToolbar.svg(color: titleColor??AppColors.colorBackgroundInfo, )
              ),
            ),
          const SizedBox(width: 20),
          UTextTitleH2(
            textColor: titleColor??AppColors.colorBackgroundInfo,
            textValue: title,
            fontWeight: FontWeight.w700
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
