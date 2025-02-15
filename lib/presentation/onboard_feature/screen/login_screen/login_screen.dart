import 'package:bus_pos_app/core/base/base_screen.dart';
import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/generated/assets.gen.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/onboard_feature/screen/login_screen/login_viewmodel.dart';
import 'package:bus_pos_app/shared/components/button/button_normal.dart';
import 'package:bus_pos_app/shared/components/text/text_default.dart';
import 'package:bus_pos_app/shared/components/text_field/text_field_component.dart';
import 'package:bus_pos_app/shared/res/dimens.dart';
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
      emailController.text = "usersaleman1";
      passwordController.text = "PosUserSale1!@";
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
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
                      child: Assets.images.vinbusLogo.image(
                        width: Dimens.current.screenWidth*0.25
                      )
                    ),
                    const SizedBox(height: Dimens.spaLPadding,),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spaKPadding
                      ),
                      child: TextDefault(
                        text: S.current.login_label,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: Dimens.scrollviewPaddingHoz,),

                    //textfield username
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimens.spaKPadding,
                        right: Dimens.spaKPadding,
                      ),
                      child: TextFieldComponent(
                        controller: emailController,
                        labelText: S.current.username,
                      ),
                    ),
                    const SizedBox(height: Dimens.spaKPadding,),

                    //text field passowrd
                    Selector<LoginViewModel,bool>(
                      selector: (context,model) => model.isSecurePass,
                      builder: (context, isShowPass, child) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: Dimens.spaKPadding,
                            right: Dimens.spaKPadding,
                          ),
                          child: TextFieldComponent(
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

                    //button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.spaKPadding,
                        vertical: Dimens.spaLPadding
                      ),
                      child: ButtonNormal(
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
