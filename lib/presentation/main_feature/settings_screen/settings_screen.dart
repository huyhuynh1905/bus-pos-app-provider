import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/main_feature/settings_screen/settings_screen_viewmodel.dart';
import 'package:bus_pos_app/presentation/main_feature/settings_screen/support/item_settings.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/border_shape/bg_border_share.dart';
import 'package:bus_pos_app/shared/components/button/button_outline.dart';
import 'package:bus_pos_app/shared/components/selection_control/switch_item.dart';
import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/components/text/text_title.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:bus_pos_app/shared/routers/router_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends BaseScreen {
  const SettingsScreen({super.key});

  @override
  BaseScreenState createState() => _SettingsScreenState();

  @override
  String getNameScreen() {
    return "SettingsScreen";
  }
}

class _SettingsScreenState extends BaseScreenState<SettingsScreenViewModel> {


  @override
  void initFunction() async {
    await provider.init();
  }

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: S.current.settings,
        showIconBack: true,
        rightIcon: Visibility(
          visible: kDebugMode,
          child: GestureDetector(
            onTap: (){
              //đến màn show demo
              provider.navigationService.navigateTo(RouteConstant.sampleScreen);
            },
            child: Container(
              padding: const EdgeInsets.all(Dimens.spaXxsPadding),
              child: Icon(
                Icons.developer_mode,
                color: AppThemesColors.current.onPrimary,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //phần thông tin
                  _buildTitle(title: S.current.info),
                  _buildListInfo(TypeItemSettings.typeInfo),

                  //phần hỗ trợ
                  _buildTitle(title: S.current.support),
                  _buildListInfo(TypeItemSettings.typeSupport),

                  //đăng xuất
                ],
              ),
            ),
          ),

          //đăng xuất
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.contentPaddingHoz,
              vertical: Dimens.spasPadding
            ),
            child: ButtonOutline(
              title: S.current.log_out,
              borderColor: AppThemesColors.current.error,
              action: (){
                //đăng xuất action
              },
            ),
          )
        ],
      ),
    );
  }

  _buildTitle({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.contentPaddingHoz,
        vertical: Dimens.spasPadding
      ),
      child: TextTitle(
        text: title,
      ),
    );
  }

  _buildListInfo(TypeItemSettings type) {
    return Selector<SettingsScreenViewModel, List<ItemSetting>>(
      selector: (ctx,model)=> type==TypeItemSettings.typeInfo ? model.listInfo : model.listSupport,
      builder: (ctx, listInfo, child){
        return ContainerComponent(
          margin: const EdgeInsets.symmetric(
            horizontal: Dimens.contentPaddingHoz
          ),
          padding: EdgeInsets.zero,
          childWidget: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: listInfo.length,
            itemBuilder: (ctx, index){
              final item = listInfo[index];
              return _itemSettingBuild(item, type);
            },
            separatorBuilder: (ctx, index){
              return _buildLineSeparator();
            },
          ),
        );
      },
    );
  }

  Widget _itemSettingBuild(ItemSetting item, TypeItemSettings type) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.contentPaddingHoz
      ),
      height: Dimens.heightItemSettings,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: TextDefault(
              text: item.title,
            ),
          ),
          _buildRightItemValue(item, type),
        ],
      ),
    );
  }

  Widget _buildLineSeparator() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimens.contentPaddingHoz
      ),
      height: Dimens.size_3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.bigRadius),
        color: AppThemesColors.current.surface
      ),
    );
  }

  _buildRightItemValue(ItemSetting item, TypeItemSettings type) {
    if(item.value!=null){
      return TextDefault(text: item.value??"", textColor: AppThemesColors.current.onTertiaryContainer,);
    }
    if(item.boolValue!=null){
      return SwitchItem(
        isOn: item.boolValue??false,
        onChanged: (newValue){
          provider.onChangeSwitchValue(type, item);
        },
      );
    }

    //else
    return Container(
      child: Icon(
        Icons.arrow_right,
        color: AppThemesColors.current.onTertiaryContainer,
      ),
    );
  }


}
