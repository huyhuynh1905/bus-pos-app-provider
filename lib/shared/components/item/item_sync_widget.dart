import 'package:bus_pos_app/domain/entity/support_ui/item_sync_entity.dart';
import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemSyncData extends StatelessWidget {
  const ItemSyncData({
    super.key,
    required this.onTap,
    required this.item,
    this.height
  });

  final Function onTap;
  final double? height;
  final ItemSyncEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //click item
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: height,
        child: Row(
          children: [
            SizedBox(
              width: Dimens.iconSyncSize,
              height: Dimens.iconSyncSize,
              child: _buildIcon(),
            ),
            TextDefault(
              text: item.title,
            )
          ],
        ),
      ),
    );
  }

  _buildIcon() {
    switch(item.status){
      case ItemSyncEntity.statusDone:
        return Padding(
          padding: const EdgeInsets.all(Dimens.size_6),
          child: Assets.lotties.lteSuccess.lottie(
            repeat: false,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.colorFilter(
                  const ['**'], // Thay đổi màu tất cả các layer
                  value: ColorFilter.mode(AppThemesColors.current.primary, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        );
      case ItemSyncEntity.statusFailed:
        return Padding(
          padding: const EdgeInsets.all(Dimens.size_6),
          child: Assets.lotties.lteFailed.lottie(
            repeat: false,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.colorFilter(
                  const ['**'], // Thay đổi màu tất cả các layer
                  value: ColorFilter.mode(AppThemesColors.current.error, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(Dimens.size_6),
          child: Assets.lotties.lteLoading.lottie(
            delegates: LottieDelegates(
              values: [
                ValueDelegate.colorFilter(
                  const ['**'], // Thay đổi màu tất cả các layer
                  value: ColorFilter.mode(AppThemesColors.current.onTertiaryContainer, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        );
    }
  }
}
