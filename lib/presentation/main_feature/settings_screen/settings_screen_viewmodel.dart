import 'package:bus_pos_app/core/base/base_view_model.dart';
import 'package:bus_pos_app/core/common/app_provider.dart';
import 'package:bus_pos_app/di/locator.dart';
import 'package:bus_pos_app/generated/l10n.dart';
import 'package:bus_pos_app/presentation/main_feature/settings_screen/support/item_settings.dart';

class SettingsScreenViewModel extends BaseViewModel{

  List<ItemSetting> listInfo = [];

  List<ItemSetting> listSupport = [];

  @override
  init() async {
    await _initVersionAndDeviceName();

    await _initListSupport();
  }

  _initVersionAndDeviceName() async {
    final version = await utilsCommon.getVersion();
    const name = "PC013123121";

    listInfo = [
      ItemSetting(title: S.current.saleman_info, actionCode: ItemSetting.acSaleInfo),
      ItemSetting(title: S.current.bus_stop_list, actionCode: ItemSetting.acBusStop),
      ItemSetting(title: S.current.history_order, actionCode: ItemSetting.acOrderHistory),
      ItemSetting(title: S.current.version_line, value: version),
      ItemSetting(title: S.current.sn_device, value: name),
    ];

    notifyListeners();
  }

  _initListSupport() {
    final isDarkMode = appProvider.isDarkThemes;
    listSupport = [
      ItemSetting(title: S.current.check_month_card, actionCode: ItemSetting.acCheckMonthCardInfo),
      ItemSetting(title: S.current.dark_mode, boolValue: isDarkMode, actionCode: ItemSetting.acDarModeInfo),
    ];

    notifyListeners();
  }

  onChangeSwitchValue(TypeItemSettings type, ItemSetting item) {
    if(type==TypeItemSettings.typeSupport) {
      switch(item.actionCode){
        case ItemSetting.acDarModeInfo:
          appProvider.onChangesThemes();
          int index = listSupport.indexWhere((e) => e.actionCode == item.actionCode);
          if (index != -1) {
            listSupport[index].boolValue = appProvider.isDarkThemes;
          }
          break;
        default:
          return;
      }
      notifyListeners();
    }
  }


}