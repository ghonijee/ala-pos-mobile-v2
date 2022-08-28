/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.env.development
  String get envDevelopment => 'assets/env/.env.development';

  /// File path: assets/env/.env.emulator
  String get envEmulator => 'assets/env/.env.emulator';

  /// File path: assets/env/.env.production
  String get envProduction => 'assets/env/.env.production';
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/launch_icon.png
  AssetGenImage get launchIcon =>
      const AssetGenImage('assets/icon/launch_icon.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesEmptyGen get empty => const $AssetsImagesEmptyGen();

  /// File path: assets/images/pos_logo.png
  AssetGenImage get posLogo =>
      const AssetGenImage('assets/images/pos_logo.png');

  /// File path: assets/images/pos_logo_light.png
  AssetGenImage get posLogoLight =>
      const AssetGenImage('assets/images/pos_logo_light.png');
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

  String get path => _assetName;

  String get keyName => _assetName;
}
