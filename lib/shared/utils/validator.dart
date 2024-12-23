import 'package:bus_pos_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class Validator {
  static const String patternEmail = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";

  static const String patternPhone = r'(^(?:[+0]9)?[0-9]{10,20}$)';

  BuildContext context;

  Validator(this.context);

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please eneter your Full Name";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isNotEmpty==true) {
      RegExp regExp = RegExp(Validator.patternEmail);
      if (regExp.hasMatch(value??"")) {
        return null;
      }
      return S.current.email_invalid;
    }
    return S.current.field_not_empty;
  }

  String? validateEmailWithoutRequire(String value) {
    if (value.isNotEmpty) {
      RegExp regExp = RegExp(Validator.patternEmail);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return S.current.email_invalid;
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return S.current.field_not_empty;
    }
    RegExp regExp = RegExp(Validator.patternPhone);
    if (!regExp.hasMatch(value)) {
      return S.current.phone_invalid;
    }
    return null;
  }



  String? validateUserName(String? value) {
    if (value?.isEmpty==true) {
      return S.current.field_not_empty;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty==true) {
      return S.current.field_not_empty;
    }
    return null;
  }

}
