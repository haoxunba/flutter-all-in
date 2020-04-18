import 'package:flutter/material.dart';

class PlatformSdkCatalogItem {
  final String title;
  final Widget targetWidget;

  PlatformSdkCatalogItem({
    @required this.title,
    @required this.targetWidget,
  })  : assert(title != null),
        assert(targetWidget != null);
}

class PlatformSdkCatalog extends StatelessWidget {
  static const double maxButtonWidth = 150;

  final List<PlatformSdkCatalogItem> catalogItems;
  final String title;

  PlatformSdkCatalog({
    @required this.title,
    @required this.catalogItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: catalogItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              catalogItems[index].title,
            ),
            trailing: Icon(
              Icons.arrow_right,
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => catalogItems[index].targetWidget),
            ),
          );
        },
      ),
    );
  }
}
