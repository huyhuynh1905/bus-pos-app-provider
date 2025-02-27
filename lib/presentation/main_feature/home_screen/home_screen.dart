import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/main_feature/home_screen/home_screen_viewmodel.dart';
import 'package:bus_pos_app/shared/components/app_bar/appbar.dart';
import 'package:bus_pos_app/shared/components/text/text_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({super.key});

  @override
  BaseScreenState createState() => _HomeScreenState();

  @override
  String getNameScreen() {
    return "HomeScreen";
  }
}

class _HomeScreenState extends BaseScreenState<HomeScreenViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextTitle(text: "Home Screen"),
      ),
    );
  }
}
