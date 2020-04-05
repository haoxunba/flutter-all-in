import 'package:flutter/material.dart';
import './routes/widgets_all_in_routes.dart';
import './routes/widgets_all_in_material_routes.dart';

final List<Map<String, PageRoute>> entries = <Map<String, PageRoute>>[
  {'Column': WidgetsAllInRoutes.widgetsAllInColumnPage()},
  {'Container': WidgetsAllInRoutes.widgetsAllInContainerPage()},
  {'Expanded': WidgetsAllInRoutes.widgetsAllInExpandedPage()},
  {'Image': WidgetsAllInRoutes.imagePage()},
  {'InkWell': WidgetsAllInRoutes.inkwellPage()},
  {'ListView': WidgetsAllInRoutes.widgetsAllInListViewPage()},
  {'Stack': WidgetsAllInRoutes.stackPage()},
  {'StatefullWidget': WidgetsAllInRoutes.statefullWidgetPage()},
  {'StatelessWidget': WidgetsAllInRoutes.statelessWidgetPage()},
  {'Text': WidgetsAllInRoutes.textPage()},
];

// 如果子wighet有一个是statefulWidget那么WidgetsAllIn就必须也是StatefulWidget
class WidgetsAllIn extends StatefulWidget {
  @override
  _WidgetsAllIn createState() => _WidgetsAllIn();
}

class _WidgetsAllIn extends State<WidgetsAllIn> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        final entry = entries[index].entries.toList();
        final String title = entry[0].key;
        return Align(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            child: RaisedButton(
              child: Text(title),
              onPressed: () {
                Navigator.of(context).push(entry[0].value);
              },
            ),
          ),
        );
      },
    );
  }
}
