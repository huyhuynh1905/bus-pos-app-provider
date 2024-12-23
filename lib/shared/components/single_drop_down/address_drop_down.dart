import 'package:flutter/material.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';

class AddressSingleDropDown<T> extends StatefulWidget {
  final Function(T) itemCallback;
  final String hintText;
  final String labelText;
  final List<T> listItem;
  Color? colorHint = Colors.red;

  AddressSingleDropDown({
    super.key,
    required this.hintText,
    required this.itemCallback,
    required this.listItem,
    required this.labelText,
    this.colorHint,
  });

  @override
  State<AddressSingleDropDown<T>> createState() => _SingleDropDownState<T>();
}

class _SingleDropDownState<T> extends State<AddressSingleDropDown<T>> {
  T? dropdownValue;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    dropdownValue = widget.listItem[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style:
              TextStyle(fontWeight: FontWeight.w300, fontSize: Dimens.size_12),
        ),
        DropdownButtonFormField<T>(
          hint: Text(widget.hintText,
              style: TextStyle(
                  fontSize: Dimens.size_14,
                  fontWeight: FontWeight.w400,
                  color: widget.colorHint)),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 20,
          iconEnabledColor: Colors.grey.shade500,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10, top: 5),
            isDense: true,
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
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
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.colorGrey3,
        ),
      ],
    );
  }
}
