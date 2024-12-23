/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $LibGen {
  const $LibGen();

  $LibGeneratedGen get generated => const $LibGeneratedGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bkg_default.jpg
  AssetGenImage get bkgDefault =>
      const AssetGenImage('assets/images/bkg_default.jpg');

  /// File path: assets/images/logo_company.png
  AssetGenImage get logoCompany =>
      const AssetGenImage('assets/images/logo_company.png');

  /// List of all assets
  List<AssetGenImage> get values => [bkgDefault, logoCompany];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/ic_setting.svg
  SvgGenImage get icSetting => const SvgGenImage('assets/svgs/ic_setting.svg');

  /// File path: assets/svgs/icon_back_toolbar.svg
  SvgGenImage get iconBackToolbar =>
      const SvgGenImage('assets/svgs/icon_back_toolbar.svg');

  /// File path: assets/svgs/icon_call_hotline.svg
  SvgGenImage get iconCallHotline =>
      const SvgGenImage('assets/svgs/icon_call_hotline.svg');

  /// File path: assets/svgs/icon_warning.svg
  SvgGenImage get iconWarning =>
      const SvgGenImage('assets/svgs/icon_warning.svg');

  /// File path: assets/svgs/logo_medic_red.svg
  SvgGenImage get logoMedicRed =>
      const SvgGenImage('assets/svgs/logo_medic_red.svg');

  /// File path: assets/svgs/logo_medic_white.svg
  SvgGenImage get logoMedicWhite =>
      const SvgGenImage('assets/svgs/logo_medic_white.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icSetting,
        iconBackToolbar,
        iconCallHotline,
        iconWarning,
        logoMedicRed,
        logoMedicWhite
      ];
}

class $LibGeneratedGen {
  const $LibGeneratedGen();

  $LibGeneratedIntlGen get intl => const $LibGeneratedIntlGen();

  /// File path: lib/generated/l10n.dart
  String get l10n => 'lib/generated/l10n.dart';

  /// List of all assets
  List<String> get values => [l10n];
}

class $LibGeneratedIntlGen {
  const $LibGeneratedIntlGen();

  /// File path: lib/generated/intl/messages_all.dart
  String get messagesAll => 'lib/generated/intl/messages_all.dart';

  /// File path: lib/generated/intl/messages_en.dart
  String get messagesEn => 'lib/generated/intl/messages_en.dart';

  /// File path: lib/generated/intl/messages_vi.dart
  String get messagesVi => 'lib/generated/intl/messages_vi.dart';

  /// List of all assets
  List<String> get values => [messagesAll, messagesEn, messagesVi];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
