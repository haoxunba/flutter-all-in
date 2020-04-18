library platform_sdk;

export 'src/platform_sdk.dart';
export 'src/platform_sdk_catalog.dart';

/// define explicitly which classes to export and omit
/// https://stackoverflow.com/questions/22494578/export-two-library-which-having-same-class-name
/// show or hide
// export 'package:flutter/material.dart'
//     show
//         CircleAvatar,
//         CircularProgressIndicator,
//         DefaultTabController,
//         FloatingActionButtonLocation,
//         IconButton;
/// 将 platform_sdk 作为公共 package，在其他地方用到 material widgets 的时候
/// 只需要 import platform_sdk，就不需要导入 package:flutter/material.dart
export 'package:flutter/material.dart';
// 每次新导出一个 package，最好在对应的依赖包重新 pub get
export 'package:path_provider/path_provider.dart';
export 'package:random_color/random_color.dart';
