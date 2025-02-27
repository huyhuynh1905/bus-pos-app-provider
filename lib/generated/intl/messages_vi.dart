// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(error) => "Đã xảy ra vấn đề khi đăng nhập: ${error}";

  static String m1(version) => "Phiên bản: ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "acc_loged_in": MessageLookupByLibrary.simpleMessage(
      "Tài khoản đang được đăng nhập, vui lòng đăng xuất hoặc liên hệ với QTV để được hỗ trợ!",
    ),
    "acc_wrong": MessageLookupByLibrary.simpleMessage(
      "Sai tài khoản đăng nhập, vui lòng kiểm tra lại!",
    ),
    "accinfo_error": MessageLookupByLibrary.simpleMessage(
      "Không thể lấy được thông tin tài khoản.",
    ),
    "account_not_valid": MessageLookupByLibrary.simpleMessage(
      "Thông tin tài khoản không hợp lệ",
    ),
    "bank_info_error": MessageLookupByLibrary.simpleMessage(
      "Đã xảy ra vấn đề khi lấy thông tin ngân hàng Napas.",
    ),
    "check": MessageLookupByLibrary.simpleMessage("Check in"),
    "close": MessageLookupByLibrary.simpleMessage("Đóng"),
    "confirm_label": MessageLookupByLibrary.simpleMessage("Xác nhận"),
    "continue_label": MessageLookupByLibrary.simpleMessage("Tiếp tục"),
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
      "Ứng dụng bán vé giao thông công cộng trên các phương tiện xe bus di chuyển xanh. Thuận tiện, nhanh chóng và minh bạch để quản lý và đồng bộ vé hành khách.",
    ),
    "label_title_splash": MessageLookupByLibrary.simpleMessage(
      "Phương tiện giao thông công cộng thân thiện với môi trường.",
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
    "publickey_error": MessageLookupByLibrary.simpleMessage(
      "Đã xảy ra vấn đề khi lấy khoá.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "sync_all_lock_atm": MessageLookupByLibrary.simpleMessage(
      "Thông tin toàn bộ thẻ ATM bị khoá",
    ),
    "sync_date": MessageLookupByLibrary.simpleMessage("Đồng bộ đầu ngày"),
    "sync_lock_atm": MessageLookupByLibrary.simpleMessage(
      "Thông tin phát sinh khoá thẻ ATM",
    ),
    "sync_month_card_route": MessageLookupByLibrary.simpleMessage(
      "Danh sách thẻ tháng của tuyến",
    ),
    "sync_object_month": MessageLookupByLibrary.simpleMessage(
      "Danh sách đối tượng thẻ tháng",
    ),
    "sync_pos_info": MessageLookupByLibrary.simpleMessage(
      "Thông tin cấu hình máy POS",
    ),
    "sync_route": MessageLookupByLibrary.simpleMessage(
      "Danh sách thông tin tuyến",
    ),
    "sync_schedule": MessageLookupByLibrary.simpleMessage("Đồng bộ lịch"),
    "sync_tickets": MessageLookupByLibrary.simpleMessage("Danh sách vé lượt"),
    "sys_response_invalid": MessageLookupByLibrary.simpleMessage(
      "Hệ thống phản hồi không hợp lệ!",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Tên tài khoản"),
    "version": m1,
  };
}
