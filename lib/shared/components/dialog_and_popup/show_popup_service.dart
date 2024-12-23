import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/shared/components/dialog_and_popup/dialog_custom_view.dart';
import 'package:bus_pos_app/shared/components/text_field/custom_text_field.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogServices{

  static const typeNone = "typeNone";
  static const typeWarning = "typeWarning";
  static const typeCall = "typeCall";

  static showTwoButtonDialog({
    required BuildContext context,
    required String title,
    required String message,
    TextStyle? textStyleTitle,
    TextStyle? textStyleDes,
    String? leftBtnTitle,
    TextStyle? leftBtnTextStyle,
    Function? leftAction,
    String? rightBtnTitle,
    TextStyle? rightBtnTextStyle,
    Function? rightAction,
    bool isCanDissmiss = true,
    Color? barrieColor,
  }){
    showDialog(
      context: context,
      barrierDismissible: isCanDissmiss,
      barrierColor: barrieColor,
      builder: (BuildContext context){
        return Container(
          margin: const EdgeInsets.all(Dimens.spaKPadding),
          alignment: Alignment.center,
          child: DialogCustomView(
            title: title,
            description: message,
            textStyleTitle: textStyleTitle,
            textStyleDes: textStyleDes,
            leftBtnTitle: leftBtnTitle,
            leftBtnTextStyle: leftBtnTextStyle,
            leftAction: leftAction,
            rightBtnTitle: rightBtnTitle,
            rightBtnTextStyle: rightBtnTextStyle,
            rightAction: rightAction,
          ),
        );
      }
    );
  }


  static showOneButtonDialog({
    required BuildContext context,
    required String title,
    required String message,
    TextStyle? textStyleTitle,
    TextStyle? textStyleDes,
    String? btnTitle,
    TextStyle? btnTextStyle,
    Function? btnAction,
    bool isCanDissmiss = true,
    Color? barrieColor,
  }){
    showDialog(
        context: context,
        barrierDismissible: isCanDissmiss,
        barrierColor: barrieColor,
        builder: (BuildContext context){
          return Container(
            margin: const EdgeInsets.all(Dimens.spaKPadding),
            alignment: Alignment.center,
            child: DialogCustomView(
              title: title,
              description: message,
              textStyleTitle: textStyleTitle,
              textStyleDes: textStyleDes,
              isShowLeftBtn: false,
              rightBtnTitle: btnTitle,
              rightBtnTextStyle: btnTextStyle,
              rightAction: btnAction,
            ),
          );
        }
    );
  }


  static showOneButtonDialogWithIconType({
    required BuildContext context,
    required String title,
    required String message,
    String typeIcon = typeWarning,
    TextStyle? textStyleTitle,
    TextStyle? textStyleDes,
    String? btnTitle,
    TextStyle? btnTextStyle,
    Function? btnAction,
    bool isCanDissmiss = true,
    Color? barrieColor,
  }){
    final iconWidget = _getIconWidgetByType(typeIcon);
    showDialog(
        context: context,
        barrierDismissible: isCanDissmiss,
        barrierColor: barrieColor,
        builder: (BuildContext context){
          return Container(
            margin: const EdgeInsets.all(Dimens.spaKPadding),
            alignment: Alignment.center,
            child: DialogCustomView(
              title: title,
              description: message,
              textStyleTitle: textStyleTitle,
              textStyleDes: textStyleDes,
              isShowLeftBtn: false,
              rightBtnTitle: btnTitle,
              rightBtnTextStyle: btnTextStyle,
              rightAction: btnAction,
              iconCenter: iconWidget,
            ),
          );
        }
    );
  }


  static showOneButtonDialogWidthTextField({
    required BuildContext context,
    required String title,
    String message = "",
    required TextEditingController controller,
    required String labelText,
    String typeIcon = typeNone,
    TextStyle? textStyleTitle,
    TextStyle? textStyleDes,
    String? btnTitle,
    TextStyle? btnTextStyle,
    Function? btnAction,
    bool isCanDissmiss = true,
    Color? barrieColor,
  }){
    final iconWidget = _getIconWidgetByType(typeIcon);
    showDialog(
        context: context,
        barrierDismissible: isCanDissmiss,
        barrierColor: barrieColor,
        builder: (BuildContext context){
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: const EdgeInsets.all(Dimens.spaKPadding),
              alignment: Alignment.center,
              child: DialogCustomView(
                title: title,
                description: message,
                textStyleTitle: textStyleTitle,
                textStyleDes: textStyleDes,
                isShowLeftBtn: false,
                rightBtnTitle: btnTitle,
                rightBtnTextStyle: btnTextStyle,
                rightAction: btnAction,
                iconCenter: iconWidget,
                widgetCenter: UCustomTextField(controller: controller, labelText: labelText),
              ),
            ),
          );
        }
    );
  }

  static Widget? _getIconWidgetByType(String typeIcon) {
    switch(typeIcon){
      case typeWarning:
        return _buildLayoutIconDialog(Assets.svgs.iconWarning.svg());
      default:
        return null;
    }
  }

  static _buildLayoutIconDialog(Widget icon){
    return Container(
      width: Dimens.size_45,
      height: Dimens.size_45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor,
      ),
      padding: const EdgeInsets.all(Dimens.size_2half),
      alignment: Alignment.center,
      child: icon,
    );
  }
}