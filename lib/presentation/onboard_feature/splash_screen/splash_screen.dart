// ignore_for_file: use_build_context_synchronously

import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/onboard_feature/splash_screen/splash_viewmodel.dart';
import 'package:bus_pos_app/shared/components/loading/loading_component.dart';
import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/components/text/text_sub_content.dart';
import 'package:bus_pos_app/shared/components/text/text_title.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/themes_and_color/themes_custom.dart';
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

  String version = "";

  @override
  void initFunction() async {
    await provider.getPackageInfo();
    version = await provider.utilsCommon.getVersion();
    //do next job
    await provider.countDownToNext();
  }


  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //ảnh và tiêu đề
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.imgBusBg.image(),
                  const SizedBox(height: Dimens.size_50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spaMPadding
                    ),
                    child: TextTitle(
                      text: S.current.label_title_splash,
                    ),
                  ),
                  const SizedBox(height: Dimens.spaKPadding,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.spaMPadding
                    ),
                    child: TextDefault(
                      text: S.current.label_des_splash,
                      textColor: AppThemesColors.current.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            //loading
            const SizedBox(height: Dimens.spaKPadding,),
            const LoadingComponent(),
            const SizedBox(height: Dimens.spaMPadding,),
            //phiên bản
            TextSubContent(
              text: S.current.version(version),
              textColor: AppThemesColors.current.onSurface,
            ),
            const SizedBox(height: Dimens.spaKPadding,)
          ],
        ),
      ),
    );
  }
}
