import 'package:bus_pos_app/shared/components/app_bar/u_appbar.dart';
import 'package:bus_pos_app/shared/components/button/button_loading_grad.dart';
import 'package:bus_pos_app/shared/components/text_field/custom_text_field.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
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
    return Scaffold(
      appBar: UAppbar(
        title: "Textfield View",
        showIconBack: true,
        isHasShadow: false,
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
              child: UCustomTextField(
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
              child: UCustomTextField(
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
              child: UCustomTextField(
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
              child: UCustomTextField(
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