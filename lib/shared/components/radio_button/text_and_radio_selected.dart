import 'package:flutter/cupertino.dart';
import 'package:bus_pos_app/shared/components/border_shape/bg_border_share.dart';

class UTextAndRadioSelected extends StatefulWidget {
  bool switchValue;
  String textValue;
  UTextAndRadioSelected(
      {super.key, required this.switchValue, required this.textValue});

  @override
  State<UTextAndRadioSelected> createState() => _UTextAndRadioSelectedState();
}

class _UTextAndRadioSelectedState extends State<UTextAndRadioSelected> {
  @override
  Widget build(BuildContext context) {
    return UBackgroundBorderShape(
        childWidget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.textValue),
        CupertinoSwitch(
          value: widget.switchValue,
          activeColor: CupertinoColors.activeBlue,
          onChanged: (bool? value) {
            setState(() {
              widget.switchValue = value ?? false;
            });
          },
        ),
      ],
    ));
  }
}
