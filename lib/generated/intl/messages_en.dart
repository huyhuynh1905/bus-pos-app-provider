// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(error) => "Đã xảy ra vấn đề khi đăng nhập: ${error}";

  static String m1(version) => "Version: ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "acc_loged_in": MessageLookupByLibrary.simpleMessage(
      "Account is logged in, please log out or contact the administrator for support!",
    ),
    "acc_wrong": MessageLookupByLibrary.simpleMessage(
      "Sai tài khoản đăng nhập, vui lòng kiểm tra lại!",
    ),
    "accinfo_error": MessageLookupByLibrary.simpleMessage(
      "Cannot get accoun sale info.",
    ),
    "account_not_valid": MessageLookupByLibrary.simpleMessage(
      "Thông tin tài khoản không hợp lệ",
    ),
    "check": MessageLookupByLibrary.simpleMessage("Check in"),
    "close": MessageLookupByLibrary.simpleMessage("Đóng"),
    "confirm_label": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "continue_label": MessageLookupByLibrary.simpleMessage("Continue"),
    "email_invalid": MessageLookupByLibrary.simpleMessage(
      "Email không đúng định dạng",
    ),
    "error_when_login": m0,
    "field_not_empty": MessageLookupByLibrary.simpleMessage(
      "Thông tin này không được để trống",
    ),
    "input_info": MessageLookupByLibrary.simpleMessage("Nhập thông tin"),
    "input_phone_number": MessageLookupByLibrary.simpleMessage("Số điện thoại"),
    "label_des_splash": MessageLookupByLibrary.simpleMessage(
      "Application for selling public transport tickets on green moving buses. Convenient, fast and transparent to manage and synchronize passenger tickets.",
    ),
    "label_title_splash": MessageLookupByLibrary.simpleMessage(
      "Environmentally friendly public transport.",
    ),
    "login_label": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "notify": MessageLookupByLibrary.simpleMessage("Thông báo"),
    "password": MessageLookupByLibrary.simpleMessage("Mật khẩu"),
    "phone_invalid": MessageLookupByLibrary.simpleMessage(
      "Số điện thoại không đúng định dạng",
    ),
    "please_enter_info": MessageLookupByLibrary.simpleMessage(
      "Vui lòng điền thông tin để tiếp tục!",
    ),
    "proudly_by_unit": MessageLookupByLibrary.simpleMessage(
      "Được cung cấp bởi UNIT CORP",
    ),
    "sync_all_lock_atm": MessageLookupByLibrary.simpleMessage(
      "Information on all locked ATM cards",
    ),
    "sync_date": MessageLookupByLibrary.simpleMessage(
      "Sync at the beginning of the day",
    ),
    "sync_lock_atm": MessageLookupByLibrary.simpleMessage(
      "Information on ATM card lock generation",
    ),
    "sync_month_card_route": MessageLookupByLibrary.simpleMessage(
      "List of monthly cards of the route",
    ),
    "sync_object_month": MessageLookupByLibrary.simpleMessage(
      "List of monthly card objects",
    ),
    "sync_pos_info": MessageLookupByLibrary.simpleMessage(
      "POS machine configuration information",
    ),
    "sync_route": MessageLookupByLibrary.simpleMessage(
      "List of route information",
    ),
    "sync_schedule": MessageLookupByLibrary.simpleMessage(
      "Synchronize schedule",
    ),
    "sync_tickets": MessageLookupByLibrary.simpleMessage(
      "List of one-way tickets",
    ),
    "sys_response_invalid": MessageLookupByLibrary.simpleMessage(
      "Hệ thống phản hồi không hợp lệ!",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "version": m1,
  };
}
