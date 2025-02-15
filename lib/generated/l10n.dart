// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Đăng nhập`
  String get login_label {
    return Intl.message('Đăng nhập', name: 'login_label', desc: '', args: []);
  }

  /// `Xác nhận`
  String get confirm_label {
    return Intl.message('Xác nhận', name: 'confirm_label', desc: '', args: []);
  }

  /// `Tiếp tục`
  String get continue_label {
    return Intl.message('Tiếp tục', name: 'continue_label', desc: '', args: []);
  }

  /// `Thông tin này không được để trống`
  String get field_not_empty {
    return Intl.message(
      'Thông tin này không được để trống',
      name: 'field_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email không đúng định dạng`
  String get email_invalid {
    return Intl.message(
      'Email không đúng định dạng',
      name: 'email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại không đúng định dạng`
  String get phone_invalid {
    return Intl.message(
      'Số điện thoại không đúng định dạng',
      name: 'phone_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message('Mật khẩu', name: 'password', desc: '', args: []);
  }

  /// `Thông báo`
  String get notify {
    return Intl.message('Thông báo', name: 'notify', desc: '', args: []);
  }

  /// `Sai tài khoản đăng nhập, vui lòng kiểm tra lại!`
  String get acc_wrong {
    return Intl.message(
      'Sai tài khoản đăng nhập, vui lòng kiểm tra lại!',
      name: 'acc_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Đã xảy ra vấn đề khi đăng nhập: {error}`
  String error_when_login(String error) {
    return Intl.message(
      'Đã xảy ra vấn đề khi đăng nhập: $error',
      name: 'error_when_login',
      desc: '',
      args: [error],
    );
  }

  /// `Đóng`
  String get close {
    return Intl.message('Đóng', name: 'close', desc: '', args: []);
  }

  /// `Thông tin tài khoản không hợp lệ`
  String get account_not_valid {
    return Intl.message(
      'Thông tin tài khoản không hợp lệ',
      name: 'account_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Check in`
  String get check {
    return Intl.message('Check in', name: 'check', desc: '', args: []);
  }

  /// `Nhập thông tin`
  String get input_info {
    return Intl.message(
      'Nhập thông tin',
      name: 'input_info',
      desc: '',
      args: [],
    );
  }

  /// `Được cung cấp bởi UNIT CORP`
  String get proudly_by_unit {
    return Intl.message(
      'Được cung cấp bởi UNIT CORP',
      name: 'proudly_by_unit',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng điền thông tin để tiếp tục!`
  String get please_enter_info {
    return Intl.message(
      'Vui lòng điền thông tin để tiếp tục!',
      name: 'please_enter_info',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống phản hồi không hợp lệ!`
  String get sys_response_invalid {
    return Intl.message(
      'Hệ thống phản hồi không hợp lệ!',
      name: 'sys_response_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại`
  String get input_phone_number {
    return Intl.message(
      'Số điện thoại',
      name: 'input_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Environmentally friendly public transport.`
  String get label_title_splash {
    return Intl.message(
      'Environmentally friendly public transport.',
      name: 'label_title_splash',
      desc: '',
      args: [],
    );
  }

  /// `Application for selling public transport tickets on green moving buses. Convenient, fast and transparent to manage and synchronize passenger tickets.`
  String get label_des_splash {
    return Intl.message(
      'Application for selling public transport tickets on green moving buses. Convenient, fast and transparent to manage and synchronize passenger tickets.',
      name: 'label_des_splash',
      desc: '',
      args: [],
    );
  }

  /// `Version: {version}`
  String version(String version) {
    return Intl.message(
      'Version: $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Account is logged in, please log out or contact the administrator for support!`
  String get acc_loged_in {
    return Intl.message(
      'Account is logged in, please log out or contact the administrator for support!',
      name: 'acc_loged_in',
      desc: '',
      args: [],
    );
  }

  /// `Sync at the beginning of the day`
  String get sync_date {
    return Intl.message(
      'Sync at the beginning of the day',
      name: 'sync_date',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
