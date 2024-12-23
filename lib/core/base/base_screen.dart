import 'package:bus_pos_app/shared/routers/navigation_services.dart';
import 'package:bus_pos_app/shared/utils/supports.dart';
import 'package:bus_pos_app/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/di/locator.dart';


abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  String getNameScreen();
  @override
  BaseScreenState createState();
}

abstract class BaseScreenState<T extends BaseViewModel> extends State<BaseScreen>
    implements AppBarSupport {
  T provider = getIt<T>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initValue(context);
  }

  void initValue(BuildContext context) {
    provider.navigationService = getIt<NavigationService>();
    provider.context = context;
    provider.utilsCommon = Utils();
    if (ModalRoute.of(context)?.settings.arguments != null) {
      provider.arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    } else {
      provider.arguments = <String, dynamic>{};
    }
    if (!provider.isInit) {
      provider.isInit = true;
      initFunction();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        initWithPostFrameCallback();
      });
    }
  }

  void initFunction() {}

  void initWithPostFrameCallback() {}

  @override
  Widget build(BuildContext context) {
    debugPrint(
        ".................................buildChild ${widget.getNameScreen()}......................................");
    return ChangeNotifierProvider<T>(
      create: (context) => provider,
      child: handlerBuild(context),
    );
  }


  Widget handlerBuild(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (hidenKeyBoardOutSide && !currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            hideKeyBoard(context);
          }
        },
        child: buildChild(context));
  }

  Widget buildChild(BuildContext context) {
    return Container();
  }

  bool get hidenKeyBoardOutSide => false;

  @override
  String? titleAppbar(BuildContext context) {
    return "";
  }

  @override
  Widget? rightAppbarComponent(BuildContext context) {
    return null;
  }

  @override
  Widget? leftAppbarComponent(BuildContext context) {
    return null;
  }

  @override
  Widget? titleByWidget(BuildContext context) {
    return null;
  }
}

abstract class AppBarSupport {
  String? titleAppbar(BuildContext context);

  Widget? rightAppbarComponent(BuildContext context);

  Widget? leftAppbarComponent(BuildContext context);

  Widget? titleByWidget(BuildContext context);
}
