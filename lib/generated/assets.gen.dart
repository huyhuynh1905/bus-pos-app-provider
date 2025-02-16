/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $LibGen {
  const $LibGen();

  /// Directory path: lib/generated
  $LibGeneratedGen get generated => const $LibGeneratedGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img_bus_bg.png
  AssetGenImage get imgBusBg =>
      const AssetGenImage('assets/images/img_bus_bg.png');

  /// File path: assets/images/vinbus_logo.png
  AssetGenImage get vinbusLogo =>
      const AssetGenImage('assets/images/vinbus_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [imgBusBg, vinbusLogo];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/lte_failed.json
  LottieGenImage get lteFailed =>
      const LottieGenImage('assets/lotties/lte_failed.json');

  /// File path: assets/lotties/lte_loading.json
  LottieGenImage get lteLoading =>
      const LottieGenImage('assets/lotties/lte_loading.json');

  /// File path: assets/lotties/lte_success.json
  LottieGenImage get lteSuccess =>
      const LottieGenImage('assets/lotties/lte_success.json');

  /// List of all assets
  List<LottieGenImage> get values => [lteFailed, lteLoading, lteSuccess];
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

  /// Directory path: lib/generated/intl
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
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
