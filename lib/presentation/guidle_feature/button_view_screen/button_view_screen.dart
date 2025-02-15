import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/button/button_gradient.dart';
import 'package:bus_pos_app/shared/components/button/button_normal.dart';
import 'package:bus_pos_app/shared/components/button/button_outline.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/colors.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class ButtonViewScreen extends StatefulWidget {
  ButtonViewScreen({super.key});

  @override
  State<ButtonViewScreen> createState() => _ButtonViewScreenState();
}

class _ButtonViewScreenState extends State<ButtonViewScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    return Scaffold(
      appBar: AppbarComponent(
        title: "Button View",
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
        child: Column(
          children: [
            ListView.separated(
              itemCount: listItem.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                top: Dimens.spaKPadding
              ),
              separatorBuilder: (ctx,index){
                return const SizedBox(height: Dimens.size_20,);
              },
              itemBuilder: (ctx, index){
                return _buildItem(listItem[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Widget item) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: Dimens.spaKPadding,
        right: Dimens.spaKPadding,
      ),
      child: item,
    );
  }

  final listItem = <Widget>[
    ButtonGradient(title: "primaryGradient", action: (){}, gradient: AppColors.primaryGradient,),
    ButtonOutline(title: "UButtonOutline", action: (){},),
    ButtonNormal(title: "UButtonNormal", action: (){},),
    ButtonNormal(title: "Button Disable", action: (){}, isDisable: true,),
  ];


  bool isLoadingButton = false;

  setLoading(){
    debugPrint("Click loading button");
    setState(() {
      isLoadingButton = true;
    });
    Future.delayed(const Duration(seconds: 5),(){
      setState(() {
        isLoadingButton = false;
      });
    });
  }
}