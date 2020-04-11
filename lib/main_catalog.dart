import 'package:flutter/material.dart';

class HomePageCatalogItem {
  final String title;
  final Widget targetWidget;

  HomePageCatalogItem({
    @required this.title,
    @required this.targetWidget,
  })  : assert(title != null),
        assert(targetWidget != null);
}

class HomePageCatalog extends StatelessWidget {
  static const double maxButtonWidth = 150;

  final List<HomePageCatalogItem> catalogItems;
  final String title;

  HomePageCatalog({
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
