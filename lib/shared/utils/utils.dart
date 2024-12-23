import 'dart:convert';
import 'dart:io';

import 'package:bus_pos_app/data/local/prefs_shared_key.dart';
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

  Utils();

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
    return "${packageInfo.version}_${packageInfo.buildNumber}";
  }


  Future<String> getToken() async {
    var preferences = await SharedPreferences.getInstance();
    var authentication = preferences.getString(PrefsSharedKey.keyAuthenticate) ?? "";
    var token = Authenticate.fromJson(json.decode(authentication)).accessToken ?? "";
    return Constants.fieldBearer + token;
  }

  Future<Authenticate?> getTokenAuthModel() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      var authentication = preferences.getString(PrefsSharedKey.keyAuthenticate) ?? "";
      var model = Authenticate.fromJson(json.decode(authentication));
      return model;
    } catch(e){
      return null;
    }
  }
}