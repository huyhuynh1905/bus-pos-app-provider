import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/domain/entity/support_ui/item_sync_entity.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/sync_feature/sync_date_screen/sync_date_screen_viewmodel.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/app_bar/settings_icon.dart';
import 'package:bus_pos_app/shared/components/border_shape/bg_border_share.dart';
import 'package:bus_pos_app/shared/components/button/button_normal.dart';
import 'package:bus_pos_app/shared/components/item/item_sync_widget.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SyncDateScreen extends BaseScreen {
  const SyncDateScreen({super.key});

  @override
  BaseScreenState createState() => _SyncDateScreenState();

  @override
  String getNameScreen() {
    return "SyncDateScreen";
  }
}

class _SyncDateScreenState extends BaseScreenState<SyncDateViewModel> {

  @override
  void initFunction() async {
    provider.init();
  }

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: S.current.sync_date,
        showIconBack: false,
        rightIcon: const SettingsIcon(),
      ),
      body: Consumer<SyncDateViewModel>(
        builder: (context,model,child) {
          return Column(
            children: [
              //dánh sách item
              Expanded(
                child: Column(
                  children: [
                    ContainerComponent(
                      childWidget: ListView.separated(
                        itemCount: provider.listSync.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx,index){
                          final item = provider.listSync[index];
                          return ItemSyncData(
                            onTap: (){
                              if(item.status==ItemSyncEntity.statusFailed){
                                provider.resyncItem(item.type, index);
                              }
                            },
                            item: item,
                          );
                        },
                        separatorBuilder: (ctx,index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.spasPadding
                            ),
                            child: Divider(
                              color: AppThemesColors.current.onTertiaryContainer,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //button tiếp tục
              Padding(
                padding: const EdgeInsets.only(
                  right: Dimens.spasPadding,
                  bottom: Dimens.spaMPadding,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    //button
                    ButtonNormal(
                      title: S.current.continue_label,
                      isDisable: provider.isCanNext,
                      action: (){

                      }
                    )
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
