// ignore_for_file: use_build_context_synchronously

import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/splash_screen/splash_viewmodel.dart';
import 'package:flutter/material.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({super.key});

  @override
  BaseScreenState<BaseViewModel> createState() => _SplashScreenState();

  @override
  String getNameScreen() {
    return 'SplashScreen';
  }
}

class _SplashScreenState extends BaseScreenState<SplashViewModel> {
  @override
  void initFunction() async {
    await provider.getPackageInfo();
    // await provider.countDownToNext(context);
  }


  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   gradient: AppColors.redGradientVertical
        // ),
        child: Center(
          child: Assets.svgs.logoMedicWhite.svg(),
        ),
      ),
    );
  }
}
