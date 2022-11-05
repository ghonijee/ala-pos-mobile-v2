/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.env.development
  String get envDevelopment => 'assets/env/.env.development';

  /// File path: assets/env/.env.emulator
  String get envEmulator => 'assets/env/.env.emulator';

  /// File path: assets/env/.env.production
  String get envProduction => 'assets/env/.env.production';

  /// List of all assets
  List<String> get values => [envDevelopment, envEmulator, envProduction];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/launch_icon.png
  AssetGenImage get launchIcon =>
      const AssetGenImage('assets/icon/launch_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [launchIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/done.svg
  SvgGenImage get done => const SvgGenImage('assets/images/done.svg');

  $AssetsImagesEmptyGen get empty => const $AssetsImagesEmptyGen();
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();

  /// File path: assets/images/pos_logo.png
  AssetGenImage get posLogo =>
      const AssetGenImage('assets/images/pos_logo.png');

  /// File path: assets/images/pos_logo_light.png
  AssetGenImage get posLogoLight =>
      const AssetGenImage('assets/images/pos_logo_light.png');

  /// File path: assets/images/rocket_loading.svg
  SvgGenImage get rocketLoading =>
      const SvgGenImage('assets/images/rocket_loading.svg');

  /// File path: assets/images/shop.svg
  SvgGenImage get shop => const SvgGenImage('assets/images/shop.svg');

  /// List of all assets
  List<dynamic> get values =>
      [done, posLogo, posLogoLight, rocketLoading, shop];
}

class $AssetsImagesEmptyGen {
  const $AssetsImagesEmptyGen();

  /// File path: assets/images/empty/cart_empty.png
  AssetGenImage get cartEmpty =>
      const AssetGenImage('assets/images/empty/cart_empty.png');

  /// File path: assets/images/empty/product_empty.png
  AssetGenImage get productEmpty =>
      const AssetGenImage('assets/images/empty/product_empty.png');

  /// File path: assets/images/empty/search_empty_state.png
  AssetGenImage get searchEmptyState =>
      const AssetGenImage('assets/images/empty/search_empty_state.png');

  /// File path: assets/images/empty/state_done.png
  AssetGenImage get stateDone =>
      const AssetGenImage('assets/images/empty/state_done.png');

  /// File path: assets/images/empty/transaction_empty.png
  AssetGenImage get transactionEmpty =>
      const AssetGenImage('assets/images/empty/transaction_empty.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [cartEmpty, productEmpty, searchEmptyState, stateDone, transactionEmpty];
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/logo-fourth-color.svg
  SvgGenImage get logoFourthColor =>
      const SvgGenImage('assets/images/logo/logo-fourth-color.svg');

  /// File path: assets/images/logo/logo-primary-second.svg
  SvgGenImage get logoPrimarySecond =>
      const SvgGenImage('assets/images/logo/logo-primary-second.svg');

  /// File path: assets/images/logo/logo-second-color.svg
  SvgGenImage get logoSecondColor =>
      const SvgGenImage('assets/images/logo/logo-second-color.svg');

  /// File path: assets/images/logo/logo-thrid-color.svg
  SvgGenImage get logoThridColor =>
      const SvgGenImage('assets/images/logo/logo-thrid-color.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [logoFourthColor, logoPrimarySecond, logoSecondColor, logoThridColor];
}

class Assets {
  Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider() => AssetImage(_assetName);

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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
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
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
