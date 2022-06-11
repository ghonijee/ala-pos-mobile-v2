// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.
library core;

import 'package:core/themes/base_theme.dart';

export 'styles/app_spacing.dart';
export 'themes/base_theme.dart';
export 'connections/connections.dart';
export 'core.dart';
export 'helpers/helpers.dart';
export 'styles/styles.dart';
export 'themes/themes.dart';
export 'utils/utils.dart';

class Core {
  static get themeLight => BaseTheme.light;
}
