import 'dart:math';

import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/presentation/guidle_feature/button_view_screen/button_view_screen.dart';
import 'package:bus_pos_app/presentation/guidle_feature/dialog_popup_view_screen/dialog_popup_view_screen.dart';
import 'package:bus_pos_app/presentation/guidle_feature/sample_component_viewmodel.dart';
import 'package:bus_pos_app/presentation/guidle_feature/selection_control_view_screen/selection_control_view_screen.dart';
import 'package:bus_pos_app/presentation/guidle_feature/textview_screen/text_view_sample_screen.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

import 'textfield_view_screen/textfield_view_screen.dart';

class SampleComponentScreen extends BaseScreen {
  const SampleComponentScreen({super.key});

  @override
  BaseScreenState<BaseViewModel> createState() => _SampleComponentScreenState();

  @override
  String getNameScreen() {
    return 'SampleComponentScreen';
  }
}

class _SampleComponentScreenState extends BaseScreenState<SampleComponentViewModel> {

  @override
  Widget buildChild(BuildContext context) {
    AppThemesColors.of(context);
    return Scaffold(
      backgroundColor: AppThemesColors.current.surface,
      appBar: AppbarComponent(
        title: "Sample Component",
        showIconBack: false,
        rightIcon: GestureDetector(
          onTap: (){
            //đổi theme
            getIt<AppProvider>().onChangesThemes();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.spaKPadding,
            ),
            child: Icon(
              Icons.lightbulb_circle_outlined,
              color: AppThemesColors.current.onPrimary,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(Dimens.spasPadding),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: Dimens.spasPadding,
          crossAxisSpacing: Dimens.spasPadding,
          childAspectRatio: 3.5,
          children: List.generate(listItem.length, (index) => _buildItem(listItem[index])),
        ),
      ),
    );
  }

  _buildItem(ItemSampleComponent item) {
    return GestureDetector(
      onTap: (){
        navigationPage(item.screen);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.mainCardRadius),
          border: Border.all(color: AppThemesColors.current.outline),
          color: _randomBackGroundColor()
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Dimens.spasPadding),
        child: TextDefault(
          text: item.title,
        ),
      ),
    );
  }

  _randomBackGroundColor(){
    final rd = Random().nextInt(3);
    switch(rd){
      case 0:
        return AppThemesColors.current.primary;
      case 1:
        return AppThemesColors.current.secondary;
      case 2:
        return AppThemesColors.current.tertiary;
      case 3:
        return AppThemesColors.current.error;
      default:
        return AppThemesColors.current.primary;
    }
  }

  navigationPage(Widget screen){
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  final listItem = [
    ItemSampleComponent("Text View", TextViewSampleScreen()),
    ItemSampleComponent("Button View", ButtonViewScreen()),
    ItemSampleComponent("Textfield View", TextfieldViewScreen()),
    ItemSampleComponent("Dialog View", DialogAndPopupViewScreen()),
    ItemSampleComponent("Selection control", SelectionControlViewScreen()),
  ];




}


class ItemSampleComponent{
  String title;
  Widget screen;

  ItemSampleComponent(this.title, this.screen);
}