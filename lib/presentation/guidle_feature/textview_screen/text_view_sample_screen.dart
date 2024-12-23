import 'package:bus_pos_app/shared/components/app_bar/u_appbar.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:flutter/material.dart';

class TextViewSampleScreen extends StatelessWidget {
  TextViewSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppbar(
        title: "Text View",
        showIconBack: true,
        isHasShadow: false,
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

  Widget _itemText(ItemTextView item) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: Dimens.spaKPadding,
        right: Dimens.spaKPadding,
      ),
      child: Text(
        item.title,
        style: item.textStyle,
      ),
    );
  }

  final listItem = [
    ItemTextView("Heading Bold 16px: Styles.textStyleHeading", Styles.textStyleHeading),
    ItemTextView("Title SemiBold 16px: Styles.textStyleTitle", Styles.textStyleTitle),
    ItemTextView("Subtile SemiBold 14px: textStyleSubTitle", Styles.textStyleSubTitle),
    ItemTextView("Body1 Medium 14px: Styles.textStyleBody1", Styles.textStyleBody1),
    ItemTextView("Body2 Regular 14px: Styles.textStyleBody2", Styles.textStyleBody2),
    ItemTextView("Content Medium 12px: Styles.textStyleContent", Styles.textStyleContent),
  ];


}


class ItemTextView{
  String title;
  TextStyle textStyle;

  ItemTextView(this.title, this.textStyle);
}