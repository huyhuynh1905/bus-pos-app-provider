import 'package:flutter/material.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';

class USingleDropDown<T> extends StatefulWidget {
  final Function(T) itemCallback;
  final String hintText;
  final List<T> listItem;
  Color? colorHint = Colors.red;

  USingleDropDown({
    super.key,
    required this.hintText,
    required this.itemCallback,
    required this.listItem,
    this.colorHint,
  });

  @override
  State<USingleDropDown<T>> createState() => _SingleDropDownState<T>();
}

class _SingleDropDownState<T> extends State<USingleDropDown<T>> {
  T? dropdownValue;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    dropdownValue = widget.listItem[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: Text(widget.hintText,
          style: TextStyle(
              fontSize: Dimens.size_14,
              fontWeight: FontWeight.w400,
              color: widget.colorHint)),
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      iconSize: 20,
      iconEnabledColor: Colors.grey.shade500,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusButton),
          borderSide: const BorderSide(
            color: AppColors.colorBorderInput,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.borderRadiusButton),
          borderSide: const BorderSide(
            color: AppColors.colorBorderInput,
            width: 1,
          ),
        ),
      ),
      dropdownColor: Colors.white,
      value: dropdownValue,
      onChanged: (T? newValue) {
        setState(() {
          dropdownValue = newValue as T;
          widget.itemCallback(newValue);
        });
      },
      items: widget.listItem.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(
            value.toString(),
            style: TextStyle(
                fontSize: Dimens.size_14, fontWeight: FontWeight.w400),
          ),
        );
      }).toList(),
    );
  }
}
