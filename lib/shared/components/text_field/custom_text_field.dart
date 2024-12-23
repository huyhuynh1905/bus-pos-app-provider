import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:flutter/material.dart';

class UCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String labelText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final double? widthField;
  final double heightField;
  final double paddingHoz;
  final double borderRadius;
  final TextStyle? textStyle;
  final TextStyle? errorTextStyle;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? countLength;
  final Color backgroundColor;
  final Color disableBackgroundColor;
  final Color borderColor;
  final Color errorBorderColor;
  final bool enable;
  final bool secure;
  final Widget? leftWidget;
  final Widget? rightWidget;

  UCustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.focusNode,
    this.onChanged,
    this.widthField,
    this.textStyle,
    this.heightField = Dimens.size_45,
    this.errorText,
    this.errorTextStyle,
    this.onSubmitted,
    this.textInputAction,
    this.textInputType,
    this.countLength,
    this.leftWidget,
    this.rightWidget,
    this.borderRadius = Dimens.borderRadiusTextField,
    this.paddingHoz = Dimens.spasPadding,
    this.enable = true,
    this.secure = false,
    this.backgroundColor = AppColors.whiteColor,
    this.disableBackgroundColor = AppColors.grayColor,
    this.borderColor = AppColors.grayBorderColor,
    this.errorBorderColor = AppColors.coralRed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widthField??double.infinity,
          height: heightField,
          padding: EdgeInsets.only(
            left: paddingHoz,
            right: paddingHoz,
            // top: Dimens.size_5
          ),
          decoration: BoxDecoration(
            color: enable ? backgroundColor : disableBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: errorText?.isNotEmpty == true ? errorBorderColor : borderColor)
          ),
          child: Row(
            children: [
              //left
              if(leftWidget!=null) leftWidget!,

              //field
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: !enable,
                  obscureText: secure,
                  focusNode: focusNode,
                  cursorHeight: Dimens.size_18,
                  cursorColor: AppColors.blackColor,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    isDense: true,
                    enabled: enable,
                    contentPadding: const EdgeInsets.only(
                      top: Dimens.size_5
                    ),
                    filled: true,
                    fillColor: enable ? backgroundColor : disableBackgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide.none, //const BorderSide(color: AppColors.marineBlue, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide.none, //const BorderSide(color: AppColors.marineBlue, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide.none, //const BorderSide(color: AppColors.marineBlue, width: 2),
                    ),
                    labelText: labelText,
                    labelStyle: Styles.textStyleLabelTextField,
                    counterText: "",
                  ),
                  style: textStyle ?? Styles.textStyleBody1,
                  maxLines: 1,
                  maxLength: countLength,
                  keyboardType: textInputType??TextInputType.text,
                  textInputAction: textInputAction??TextInputAction.done,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                ),
              ),

              //right
              if(rightWidget!=null) rightWidget!,
            ],
          )
        ),

        //text error
        Visibility(
          visible: errorText?.isNotEmpty==true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Dimens.size_3,
              horizontal: Dimens.spasPadding
            ),
            child: Text(
              errorText??"",
              style: errorTextStyle??Styles.textFieldErrorStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )

      ],
    );
  }
}
