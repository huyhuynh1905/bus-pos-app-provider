import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/main_feature/settings_screen/settings_screen_viewmodel.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends BaseScreen {
  const SettingsScreen({super.key});

  @override
  BaseScreenState createState() => _SettingsScreenState();

  @override
  String getNameScreen() {
    return "SettingsScreen";
  }
}

class _SettingsScreenState extends BaseScreenState<SettingsScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: S.current.settings,
        showIconBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //phần thông tin

            //phần cài đặt

            //phần hỗ trợ

            //đăng xuất
          ],
        ),
      ),
    );
  }
}
