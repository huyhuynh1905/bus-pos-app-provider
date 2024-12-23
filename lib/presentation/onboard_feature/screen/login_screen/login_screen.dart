import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/login_screen/login_viewmodel.dart';
import 'package:bus_pos_app/shared/components/button/button_gradient.dart';
import 'package:bus_pos_app/shared/components/text_field/custom_text_field.dart';
import 'package:bus_pos_app/shared/res/colors.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
import 'package:bus_pos_app/shared/res/style_text.dart';
import 'package:bus_pos_app/shared/utils/common.dart';
import 'package:bus_pos_app/shared/utils/supports.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});

  @override
  BaseScreenState<BaseViewModel> createState() => _LoginScreenState();

  @override
  String getNameScreen() {
    return 'LoginScreen';
  }
}

class _LoginScreenState extends BaseScreenState<LoginViewModel> with WidgetsBindingObserver {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();
  GlobalKey<FormState> emailKey = GlobalKey();
  GlobalKey<FormState> passwordKey = GlobalKey();

  @override
  void initFunction() {
    if(kDebugMode){
      emailController.text = "unit_cip@unit.com.vn";
      passwordController.text = "Cip!@#2020";
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    int sizeRender = 50;

    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.pinkGradientVertical
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: Dimens.current.topSafePadding,),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Assets.svgs.logoMedicRed.svg()
                    ),
                    const SizedBox(height: Dimens.scrollviewPaddingHoz,),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spaKPadding
                      ),
                      child: Text(
                        S.current.login_label,
                        style: Styles.textStyleSubTitle,
                      ),
                    ),
                    const SizedBox(height: Dimens.scrollviewPaddingHoz,),

                    //textfield username
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimens.spaKPadding,
                        right: Dimens.spaKPadding,
                      ),
                      child: UCustomTextField(
                        controller: emailController,
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: Dimens.spasPadding,),

                    //text field passowrd
                    Selector<LoginViewModel,bool>(
                      selector: (context,model) => model.isSecurePass,
                      builder: (context, isShowPass, child) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.spaKPadding,
                            right: Dimens.spaKPadding,
                          ),
                          child: UCustomTextField(
                            controller: passwordController,
                            labelText: S.current.password,
                            secure: provider.isSecurePass,
                            rightWidget: IconButton(
                              icon: Icon(
                                provider.isSecurePass ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () => provider.showPass(),
                            ),
                          ),
                        );
                      }
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){
                          customLog("Click quên mật khẩu");
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(Dimens.spaKPadding),
                          child: Text(
                            "Quên mật khẩu?",
                            style: Styles.textStyleBody2.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor
                            ),
                          ),
                        ),
                      ),
                    ),

                    //button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spaKPadding,
                        vertical: Dimens.spaKPadding
                      ),
                      child: UButtonGradient(
                        width: double.infinity,
                        title: S.current.login_label,
                        action: () {
                          hideKeyBoard(context);
                          provider.doLogin(this.context, emailController.text, passwordController.text);
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addObserver(this);
    emailFocusNode.addListener(() {
      provider.showClear(emailFocusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();

  }
}
