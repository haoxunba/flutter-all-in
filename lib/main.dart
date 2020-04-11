import 'package:flutter/material.dart';

/// Importing files from outside lib/ is not supposed to work.
/// This would prevent publishing packages to pub.dartlang.org
/// because only lib/ and bin/ are downloaded when added to dependencies.
/// https://stackoverflow.com/questions/54197007/import-dart-file-outside-lib-directory
/// 所以这里都是推荐通过 package 的方式导入
import 'package:feature_registry/feature_registry.dart';
import 'main_catalog.dart';
// import 'package:platform_sdk/platform_sdk.dart';

void main() => runApp(Shell());

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      title: 'Flutter All In', // 这里的title会被HomePage的title覆盖
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageCatalog(
      title: 'Flutter All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<HomePageCatalogItem> catalogItems = [
  HomePageCatalogItem(
    title: 'Widgets All In',
    targetWidget: buildAppModules()[0],
  ),
  HomePageCatalogItem(
    title: 'Plugins All In',
    targetWidget: buildAppModules()[1],
  ),
  HomePageCatalogItem(
    title: 'Function All In',
    targetWidget: buildAppModules()[2],
  ),
];
