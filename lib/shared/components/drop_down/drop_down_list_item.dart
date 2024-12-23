import 'package:flutter/material.dart';
import 'package:bus_pos_app/shared/components/border_shape/bg_border_share.dart';
import 'package:bus_pos_app/shared/utils/common.dart';

class DropdownListItem extends StatefulWidget {
  String labelText;
  String valueText;
  List<dynamic> items;
  Function(dynamic value) onChanged;
  DropdownListItem({
    super.key,
    required this.labelText,
    required this.valueText,
    required this.items,
    required this.onChanged,
  });

  @override
  State<DropdownListItem> createState() => _DropdownListItemState();
}

class _DropdownListItemState extends State<DropdownListItem> {
  bool showListView = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showListView = !showListView;
        });
      },
      child: UBackgroundBorderShape(
        childWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: (showListView)
              ? Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 100,
                      child: ListView.builder(
                        itemCount: widget.items.length,
                        itemBuilder: (context, int index) {
                          return ItemViewDropDown(
                            listItem: widget.items,
                            position: index,
                            itemCallback: (itemSelected) {
                              setState(() {
                                showListView = !showListView;
                              });
                              widget.onChanged(itemSelected);
                            },
                          );
                        },
                      ),
                    ),
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        size: 20,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.labelText,
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          widget.valueText,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ItemViewDropDown extends StatelessWidget {
  int position;
  List<dynamic> listItem;
  Function itemCallback;
  ItemViewDropDown({
    super.key,
    required this.position,
    required this.itemCallback,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    if (position != 0) {
      return GestureDetector(
        onTap: () {
          itemCallback(listItem[position]);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text('${listItem[position]}'),
        ),
      );
    } else {
      return Container();
    }
  }
}
