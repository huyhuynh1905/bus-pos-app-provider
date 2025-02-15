import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/selection_control/checkbox_component.dart';
import 'package:bus_pos_app/shared/components/selection_control/radio_component.dart';
import 'package:bus_pos_app/shared/components/selection_control/switch_item.dart';
import 'package:bus_pos_app/shared/components/text/text_title.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
import 'package:flutter/material.dart';

class SelectionControlViewScreen extends StatefulWidget {
  SelectionControlViewScreen({super.key});

  @override
  State<SelectionControlViewScreen> createState() => _SelectionControlViewScreenState();
}

class _SelectionControlViewScreenState extends State<SelectionControlViewScreen> {

  List<String> listRadio = ["Option 1", "Option 2", "Option 3"];
  String currentRadio = "";

  List<ItemCheckBox> listCheckbox = [
    ItemCheckBox("Option 1", false, false),
    ItemCheckBox("Option 2", false, false),
    ItemCheckBox("Option 3", true, false),
    ItemCheckBox("Option 4", true, true),
    ItemCheckBox("Option 5", false, true),
  ];

  bool switcher1 = false;
  bool switcher2 = false;

  @override
  void initState() {
    super.initState();
    currentRadio = listRadio[0];
  }

  @override
  Widget build(BuildContext context) {
    AppThemesColors.of(context);
    return Scaffold(
      appBar: Appbar(
        title: "Selection Control View",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //radio
              const SizedBox(height: Dimens.size_20,),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.spaKPadding,
                  right: Dimens.spaKPadding,
                ),
                child: TextTitle(
                  text: "Radio Button",
                ),
              ),
              const SizedBox(height: Dimens.size_10,),
              Container(
                child: Column(
                  children: listRadio.map((e) => _buildItemRadio(e)).toList(),
                ),
              ),

              //check box
              const SizedBox(height: Dimens.size_20,),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.spaKPadding,
                  right: Dimens.spaKPadding,
                ),
                child: TextTitle(
                  text: "Checkbox Button",
                ),
              ),
              const SizedBox(height: Dimens.size_10,),
              Container(
                child: Column(
                  children: listCheckbox.map((e) => _buildItemCheckbox(e)).toList(),
                ),
              ),

              //switch or toggle
              const SizedBox(height: Dimens.size_20,),
              Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.spaKPadding,
                  right: Dimens.spaKPadding,
                ),
                child: TextTitle(
                  text: "Switch Button",
                ),
              ),
              const SizedBox(height: Dimens.size_10,),
              Container(
                padding: const EdgeInsets.only(
                  left: Dimens.spaKPadding
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SwitchItem(
                          isOn: switcher1,
                          onChanged: (newValue){
                            setState(() {
                              switcher1 = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SwitchItem(
                          isOn: switcher1,
                          isHasThumb: true,
                          onChanged: (newValue){
                            setState(() {
                              switcher1 = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SwitchItem(
                          isOn: true,
                          isDisable: true,
                          onChanged: (newValue){
                            setState(() {
                              switcher1 = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Option 1",
                          style: Styles.textStyleBody1,
                        ),
                        SwitchItem(
                          isOn: switcher2,
                          isHasThumb: true,
                          onChanged: (newValue){
                            setState(() {
                              switcher2 = newValue;
                            });
                          },
                        ),
                        const Text(
                          "Option 2",
                          style: Styles.textStyleBody1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Option 1",
                          style: Styles.textStyleBody1,
                        ),
                        SwitchItem(
                          isOn: switcher2,
                          onChanged: (newValue){
                            setState(() {
                              switcher2 = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ]
                ),
              ),

              const SizedBox(height: Dimens.size_50,),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildItemRadio(String e) {
    return RadioComponent(value: e, isDisable: e=="Option 3", groupValue: currentRadio, onChanged: (value){
      setState(() {
        currentRadio = value??"";
      });
    });
  }

  Widget _buildItemCheckbox (ItemCheckBox e) {
    final index = listCheckbox.indexOf(e);
    return CheckboxComponent(value: e.title, isDisable: e.isDisable, onChanged: (value){
      setState(() {
        listCheckbox[index].isChecked = value??false;
      });
    }, isChecked: e.isChecked,);
  }

}

class ItemCheckBox{
  String title;
  bool isChecked;
  bool isDisable;

  ItemCheckBox(this.title, this.isChecked, this.isDisable);
}