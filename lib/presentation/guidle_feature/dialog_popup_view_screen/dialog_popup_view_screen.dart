import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/button/button_component.dart';
import 'package:bus_pos_app/shared/components/dialog_and_popup/show_popup_service.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class DialogAndPopupViewScreen extends StatefulWidget {
  DialogAndPopupViewScreen({super.key});

  @override
  State<DialogAndPopupViewScreen> createState() => _DialogAndPopupViewScreenState();
}

class _DialogAndPopupViewScreenState extends State<DialogAndPopupViewScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    return Scaffold(
      appBar: Appbar(
        title: "DialogAndPopup View",
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
            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: ButtonComponent(
                title: "Normal Popup",
                width: double.infinity,
                action: (){
                  //showNormal Popup
                  ShowDialogServices.showTwoButtonDialog(
                    context: context,
                    title: "Xác nhận",
                    message: "Việc đóng màn hình có thể gây mất dữ liệu nếu bạn chưa lưu. Vui lòng xác nhận trước khi đóng?",

                  );
                },
              ),
            ),

            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: ButtonComponent(
                title: "One Button Popup",
                width: double.infinity,
                action: (){
                  //showNormal Popup
                  ShowDialogServices.showOneButtonDialog(
                    context: context,
                    title: "Xác nhận",
                    message: "Việc đóng màn hình có thể gây mất dữ liệu nếu bạn chưa lưu. Vui lòng xác nhận trước khi đóng?",
                  );
                },
              ),
            ),

            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: ButtonComponent(
                title: "Icon Popup",
                width: double.infinity,
                action: (){
                  //showNormal Popup
                  ShowDialogServices.showOneButtonDialogWithIconType(
                    context: context,
                    title: "Xác nhận",
                    message: "Việc đóng màn hình có thể gây mất dữ liệu nếu bạn chưa lưu. Vui lòng xác nhận trước khi đóng?",
                  );
                },
              ),
            ),

            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: ButtonComponent(
                title: "Dialog TextField Popup",
                width: double.infinity,
                action: (){
                  //showNormal Popup
                  ShowDialogServices.showOneButtonDialogWidthTextField(
                    context: context,
                    controller: TextEditingController(),
                    labelText: "Nhập tên",
                    title: "Xác nhận",
                    message: "Việc đóng màn hình có thể gây mất dữ liệu nếu bạn chưa lưu. Vui lòng xác nhận trước khi đóng?",
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

}