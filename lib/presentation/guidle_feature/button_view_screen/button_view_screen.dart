import 'package:bus_pos_app/shared/components/app_bar/u_appbar.dart';
import 'package:bus_pos_app/shared/components/button/button_gradient.dart';
import 'package:bus_pos_app/shared/components/button/button_normal.dart';
import 'package:bus_pos_app/shared/components/button/button_outline.dart';
import 'package:bus_pos_app/shared/components/button/button_loading_grad.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
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
    return Scaffold(
      appBar: UAppbar(
        title: "Button View",
        showIconBack: true,
        isHasShadow: false,
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
            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: UButtonLoadingGradient(title: "LoadingButton", action: (){
                setLoading();
              }, isLoading: isLoadingButton,),
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
    UButtonGradient(title: "primaryGradient", action: (){}, gradientColor: AppColors.primaryGradient,),
    UButtonGradient(title: "redGradientVertical", action: (){},),
    UButtonOutline(title: "UButtonOutline", action: (){},),
    UButtonNormal(title: "UButtonNormal", action: (){},),
    UButtonNormal(title: "Button Disable", action: (){}, isDisable: true,),
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