import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/sync_date_screen/sync_date_screen_viewmodel.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:flutter/material.dart';

class SyncDateScreen extends BaseScreen {
  const SyncDateScreen({super.key});

  @override
  BaseScreenState createState() => _SyncDateScreenState();

  @override
  String getNameScreen() {
    return "SyncDateScreen";
  }
}

class _SyncDateScreenState extends BaseScreenState<SyncDateViewModel> {
  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        title: S.current.sync_date,
        showIconBack: false,
        rightIcon: Container( //icon click đi đến settings
          child: Center(),
        ),
      ),
      body: SingleChildScrollView(

      ),
    );
  }
}
