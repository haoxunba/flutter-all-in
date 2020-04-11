import 'package:flutter/material.dart';

class FunctionAllInCatalogItem {
  final String title;
  final Widget targetWidget;

  FunctionAllInCatalogItem({
    @required this.title,
    @required this.targetWidget,
  })  : assert(title != null),
        assert(targetWidget != null);
}

class FunnctionAllInCatalog extends StatelessWidget {
  static const double maxButtonWidth = 150;

  final List<FunctionAllInCatalogItem> catalogItems;
  final String title;

  FunnctionAllInCatalog({
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
