import 'dart:convert';
import 'dart:io';

import 'package:bus_pos_app/data/local/storage_shared/prefs_crypt.dart';
import 'package:bus_pos_app/data/local/storage_shared/prefs_shared.dart';
import 'package:bus_pos_app/data/local/storage_shared/prefs_shared_key.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/domain/entity/authenticate.dart';
import 'package:bus_pos_app/domain/entity/device_info.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils{
  late BuildContext context;
  final _prefShared = getIt<PrefsShared>();
  final _prefsScrypt = getIt<PrefsCrypt>();

  Utils();

  String convertJsonMapToStr(Map<String, dynamic>? json){
    if(json==null){
      return "";
    }
    final convert = const JsonEncoder().convert(json);
    return convert;
  }

  Future<DeviceInfo> getDeviceInfo() async {
    var data = DeviceInfo();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedIdentifier = prefs.getString(PrefsSharedKey.keyIdentify) ?? "";
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      data.model = androidInfo.model;
      data.deviceName = androidInfo.model;
      if (savedIdentifier.isNotEmpty) {
        data.identifier = savedIdentifier;
      } else {
        data.identifier = androidInfo.id;
        prefs.setString(PrefsSharedKey.keyIdentify, androidInfo.id);
      }
      data.osVersion = androidInfo.version.release;
    }
    if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      data.model = iosInfo.utsname.machine;
      data.deviceName = iosInfo.name;
      if (savedIdentifier.isNotEmpty) {
        data.identifier = savedIdentifier;
      } else {
        data.identifier = await savedIOSIdentifier(PrefsSharedKey.keyIdentify ,iosInfo.identifierForVendor??"");
        prefs.setString(PrefsSharedKey.keyIdentify, data.identifier??"");
      }
      data.osVersion = iosInfo.systemVersion;
    }
    return data;
  }

  Future<String> savedIOSIdentifier(String key, String deviceId) async {
    // Create storage
    const storage = FlutterSecureStorage();
    // Read value
    String? value = await storage.read(key: key);
    if (!(value?.isNotEmpty==true)) {
      //null hoặc empty
      await storage.write(key: key, value: deviceId);
      return deviceId;
    } else {
      //có giá trị
      return value!;
    }
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return "${packageInfo.version} (${packageInfo.buildNumber})";
  }


  ///token
  Future<String> getToken() async {
    var authentication = await _prefsScrypt.authenticateModelStr;
    if(authentication==null) return "";
    var token = Authenticate.fromJson(json.decode(authentication)).accessToken ?? "";
    // debugPrint("getToken => $token");
    return Constants.fieldBearer + token;
  }

  Future<String> getTokenNoBearer() async {
    var authentication = await _prefsScrypt.authenticateModelStr;
    if(authentication==null) return "";
    var token = Authenticate.fromJson(json.decode(authentication)).accessToken ?? "";
    // debugPrint("getTokenNoBearer => $token");
    return token;
  }

  Future<String> getSessionToken() async {
    var authentication = await _prefsScrypt.authenticateModelStr;
    if(authentication==null) return "";
    var token = Authenticate.fromJson(json.decode(authentication)).refreshToken ?? "";
    debugPrint("refreshToken => $token");
    return token;
  }

  ///model auth
  Future<Authenticate?> getTokenAuthModel() async {
    try {
      var authentication = await _prefsScrypt.authenticateModelStr;
      if(authentication==null) return null;
      var model = Authenticate.fromJson(json.decode(authentication));
      return model;
    } catch(e){
      return null;
    }
  }


}