import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:flutter/material.dart';

class UButtonLoadingGradient extends StatelessWidget {
  final String title;
  final String textLoading;
  final TextStyle? titleStyle;
  final Function action;
  final double borderRadius;
  final double height;
  final double width;
  final double sizeLoading;
  final bool isLoading;
  final Gradient gradientColor;

  const UButtonLoadingGradient({
    super.key,
    required this.title,
    required this.action,
    this.titleStyle,
    this.textLoading = "Vui lòng đợi...",
    this.isLoading = false,
    this.sizeLoading = Dimens.size_15,
    this.borderRadius = 5,
    this.height = Dimens.size_50,
    this.width = 100,
    this.gradientColor = AppColors.redGradientVertical,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        gradient: gradientColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          if(!isLoading) {
            action();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: AppColors.splashClickColor,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.spaXsPadding
          )
        ),
        child: Container(
          width: double.infinity,
          height: height,
          alignment: Alignment.center,
          child: isLoading ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: sizeLoading,
                height: sizeLoading,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                textLoading,
                style: titleStyle??Styles.textStyleButtonGrad,
              )
            ],
          ) : Text(
            title,
            style: titleStyle??Styles.textStyleButtonGrad,
          ),
        ),
      ),
    );
  }
}
