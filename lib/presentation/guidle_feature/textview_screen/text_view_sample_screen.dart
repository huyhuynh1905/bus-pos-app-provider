import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/text/text_component.dart';
import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/components/text/text_sub_content.dart';
import 'package:bus_pos_app/shared/components/text/text_title.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class TextViewSampleScreen extends StatelessWidget {
  TextViewSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    final listItem = [
      TextDefault(text: "TextDefault",),
      TextSubContent(text: "TextSubContent",),
      TextTitle(text: "TextTitle",),
    ];

    return Scaffold(
      appBar: Appbar(
        title: "Text View",
        showIconBack: true,
        isHasShadow: false,
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
        padding: EdgeInsets.all(Dimens.spasPadding),
        child: ListView.separated(
          itemCount: listItem.length,
          separatorBuilder: (ctx,index){
            return const SizedBox(height: Dimens.size_20,);
          },
          itemBuilder: (ctx, index){
            return _itemText(listItem[index]);
          },
        )
      ),
    );
  }

  Widget _itemText(TextComponent item) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: Dimens.spaKPadding,
        right: Dimens.spaKPadding,
      ),
      child: item,
    );
  }

}


class ItemTextView{
  String title;
  TextStyle textStyle;

  ItemTextView(this.title, this.textStyle);
}