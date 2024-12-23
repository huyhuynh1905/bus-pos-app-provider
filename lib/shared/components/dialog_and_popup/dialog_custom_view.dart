import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/shared/components/button/button_normal.dart';
import 'package:bus_pos_app/shared/components/button/button_outline.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:flutter/material.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';

class DialogCustomView extends StatelessWidget {

  String title;
  String description;
  TextStyle? textStyleTitle;
  TextStyle? textStyleDes;
  bool isShowLeftBtn;
  String? leftBtnTitle;
  TextStyle? leftBtnTextStyle;
  Function? leftAction;
  bool isShowRightBtn;
  String? rightBtnTitle;
  TextStyle? rightBtnTextStyle;
  Function? rightAction;
  Widget? iconCenter;
  Widget? widgetCenter;

  DialogCustomView({
    super.key,
    this.title = "",
    this.description = "",
    this.textStyleTitle,
    this.textStyleDes,
    this.isShowLeftBtn = true,
    this.isShowRightBtn = true,
    this.leftBtnTextStyle,
    this.rightBtnTextStyle,
    this.leftBtnTitle,
    this.rightBtnTitle,
    this.leftAction,
    this.rightAction,
    this.iconCenter,
    this.widgetCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimens.borderRadiusDialog),
          ),
          margin: EdgeInsets.only(
            top: iconCenter!=null ? Dimens.size_25 : 0
          ),
          padding: EdgeInsets.only(
            top: iconCenter!=null ? Dimens.size_25 : Dimens.spaMPadding,
            left: Dimens.spaMPadding,
            right: Dimens.spaMPadding,
            bottom: Dimens.spasPadding
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textStyleTitle??Styles.textStyleTitle,
              ),
              const SizedBox(height: Dimens.spasPadding),
              Visibility(
                visible: description.isNotEmpty,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: textStyleDes??Styles.textStyleBody1,
                ),
              ),
              const SizedBox(height: Dimens.spaKPadding),
              Visibility(
                visible: widgetCenter!=null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.spaKPadding
                  ),
                  child: widgetCenter??Container(),
                ),
              ),
              Visibility(
                visible: widgetCenter==null,
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColors.colorStrockMain,
                ),
              ),
              const SizedBox(height: Dimens.spasPadding),


              //Phần button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //button 1
                  Visibility(
                    visible: isShowLeftBtn,
                    child: UButtonOutline(
                      title: leftBtnTitle??S.current.close,
                      titleStyle: leftBtnTextStyle,
                      height: Dimens.size_45,
                      action: (){
                        Navigator.of(context).maybePop();
                        try{
                          leftAction!();
                        } catch(e){
                          //
                        }
                      },
                    ),
                  ),
                  Visibility(
                    visible: isShowLeftBtn&&isShowRightBtn,
                    child: const SizedBox(width: Dimens.spaKPadding,),
                  ),
                  Visibility(
                    visible: isShowRightBtn,
                    child: UButtonNormal(
                      title: rightBtnTitle??S.current.confirm_label,
                      titleStyle: rightBtnTextStyle,
                      height: Dimens.size_45,
                      action: (){
                        Navigator.of(context).maybePop();
                        try{
                          rightAction!();
                        } catch(e){
                          //
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: Dimens.spaXxsPadding,
          child: iconCenter??Container(),
        ),
      ],
    );
  }
}
