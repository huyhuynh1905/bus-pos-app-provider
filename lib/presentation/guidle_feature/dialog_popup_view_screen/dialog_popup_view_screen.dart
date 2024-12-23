import 'package:bus_pos_app/shared/components/app_bar/u_appbar.dart';
import 'package:bus_pos_app/shared/components/button/button_normal.dart';
import 'package:bus_pos_app/shared/components/dialog_and_popup/show_popup_service.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
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
    return Scaffold(
      appBar: UAppbar(
        title: "DialogAndPopup View",
        showIconBack: true,
        isHasShadow: false,
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
              child: UButtonNormal(
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
              child: UButtonNormal(
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
              child: UButtonNormal(
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
              child: UButtonNormal(
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