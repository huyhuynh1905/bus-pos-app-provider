import 'dart:convert';

import 'package:bus_pos_app/data/local/prefs_shared_key.dart';
import 'package:bus_pos_app/domain/entity/account_info_entity.dart';
import 'package:bus_pos_app/domain/entity/company_info_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PrefsCrypt {
  PrefsCrypt(this._secureStorage);

  final FlutterSecureStorage _secureStorage;


  //auth
  Future<String?> get authenticateModelStr => _secureStorage.read(key: PrefsSharedKey.keyAuthenticate);

  saveAuthenticateModel(String authModel) async {
    await _secureStorage.write(key: PrefsSharedKey.keyAuthenticate, value: authModel);
  }

  Future<AccountInfoEntity?> getAccount() async {
    final accStr = await _secureStorage.read(key: PrefsSharedKey.keyAccountInfo);
    if(accStr == null) return null;
    final account = AccountInfoEntity.fromJson(json.decode(accStr));
    return account;
  }

  saveAccountInfo(String accountStr) async {
    await _secureStorage.write(key: PrefsSharedKey.keyAccountInfo, value: accountStr);
  }

  Future<CompanyInfoEntity?> getCompanyInfo() async {
    final companyInfoStr = await _secureStorage.read(key: PrefsSharedKey.keyCompanyInfo);
    if(companyInfoStr == null) return null;
    final companyInfo = CompanyInfoEntity.fromJson(json.decode(companyInfoStr));
    return companyInfo;
  }

  saveCompanyInfo(String accountStr) async {
    await _secureStorage.write(key: PrefsSharedKey.keyCompanyInfo, value: accountStr);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

}