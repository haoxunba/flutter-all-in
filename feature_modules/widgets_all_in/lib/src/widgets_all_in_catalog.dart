import 'package:flutter/material.dart';

class WidgetsAllInCatalogItem {
  final String title;
  final Widget targetWidget;

  WidgetsAllInCatalogItem({
    @required this.title,
    @required this.targetWidget,
  })  : assert(title != null),
        assert(targetWidget != null);
}

class WidgetsAllInCatalog extends StatelessWidget {
  static const double maxButtonWidth = 150;

  final List<WidgetsAllInCatalogItem> catalogItems;
  final String title;

  WidgetsAllInCatalog({
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
