import 'package:flutter/material.dart';

void hideKeyBoard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
