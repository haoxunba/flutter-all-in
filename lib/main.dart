import 'package:flutter/material.dart';

/// Importing files from outside lib/ is not supposed to work.
/// This would prevent publishing packages to pub.dartlang.org
/// because only lib/ and bin/ are downloaded when added to dependencies.
/// https://stackoverflow.com/questions/54197007/import-dart-file-outside-lib-directory
/// 所以这里都是推荐通过 package 的方式导入
import 'package:platform_sdk/platform_sdk.dart';

void main() => runApp(PlatformSdk());
