import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/text_field/text_field_component.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class TextfieldViewScreen extends StatefulWidget {
  TextfieldViewScreen({super.key});

  @override
  State<TextfieldViewScreen> createState() => _TextfieldViewScreenState();
}

class _TextfieldViewScreenState extends State<TextfieldViewScreen> {

  TextEditingController defaultCtl = TextEditingController();
  TextEditingController passsCtl = TextEditingController();
  TextEditingController disableCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
    disableCtl.text = "ReadOnly data";
  }

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    return Scaffold(
      appBar: AppbarComponent(
        title: "Textfield View",
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
        padding: const EdgeInsets.all(Dimens.spasPadding),
        child: Column(
          children: [
            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: TextFieldComponent(
                controller: defaultCtl,
                labelText: 'Default Textfield',
              ),
            ),
            const SizedBox(height: Dimens.size_20,),

            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: TextFieldComponent(
                controller: defaultCtl,
                labelText: 'Error TextField',
                errorText: "Vui lòng không để trống",
              ),
            ),

            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: TextFieldComponent(
                controller: passsCtl,
                labelText: 'Password TextField',
                secure: secure,
                rightWidget: GestureDetector(
                  onTap: (){
                    secureAction();
                  },
                  child: secure ? const Icon(Icons.remove_red_eye_outlined) : const Icon(Icons.remove_red_eye),
                ),
              ),
            ),

            const SizedBox(height: Dimens.size_20,),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimens.spaKPadding,
                right: Dimens.spaKPadding,
              ),
              child: TextFieldComponent(
                controller: disableCtl,
                labelText: 'Disable/readOnly TextField',
                enable: false,
              ),
            ),
          ],
        ),
      ),
    );
  }



  bool secure = true;

  secureAction(){
    debugPrint("Click loading button");
    setState(() {
      secure = !secure;
    });
  }
}