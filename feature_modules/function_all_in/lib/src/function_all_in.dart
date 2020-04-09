import 'package:flutter/material.dart';
import 'routes/function_all_in_routes.dart';

// final List<Map<String, PageRoute>> entries = <Map<String, PageRoute>>[
//   {'Column': WidgetsAllInRoutes.widgetsAllInColumnPage()},
//   {'Container': WidgetsAllInRoutes.widgetsAllInContainerPage()},
//   {'Expanded': WidgetsAllInRoutes.widgetsAllInExpandedPage()},
//   {'Form': WidgetsAllInRoutes.widgetsAllInFormPage()},
//   {'Image': WidgetsAllInRoutes.imagePage()},
//   {'InkWell': WidgetsAllInRoutes.inkwellPage()},
//   {'ListView': WidgetsAllInRoutes.widgetsAllInListViewPage()},
//   {'Stack': WidgetsAllInRoutes.stackPage()},
//   {'StatefullWidget': WidgetsAllInRoutes.statefullWidgetPage()},
//   {'StatelessWidget': WidgetsAllInRoutes.statelessWidgetPage()},
//   {'Text': WidgetsAllInRoutes.textPage()},
//   {
//     'Material Scaffold':
//         WidgetsAllInMaterialRoutes.widgetsAllInMaterialScaffold()
//   },
// ];
/// 每次点击一个路由跳转到二级页面然后返回一级页面，再次点击想要跳转到二级页面时，
/// 上面注释的List导致报错
/// Cannot install a MaterialPageRoute<dynamic> after disposing it.
/// 因为在下面应用时，ListView.builder中每个RaisedButton的onPressed对应的route
/// 都是同一个reference，指向同一个堆栈地址List，所以在从二级页面回到一级页面时，
/// dispose的是整个List对应的所有路由，所以再次从一级页面回到二级页面时，会出现上面的错误信息
/// 解决办法是，通过Class包裹，每次回到一级页面时，都会重新创建一个List
/// https://stackoverflow.com/questions/55417201/cannot-install-a-materialpageroutevoid-after-disposing-it
class RoteList {
  final List<Map<String, PageRoute>> entries = <Map<String, PageRoute>>[
    {'Column': FunctionAllInRoutes.functionAllInKeyPage()},
  ];
}

class FunctionAllIn extends StatefulWidget {
  // 配合上面提到的错误，写在这里不起作用
  // final routeList = RoteList().entries;
  @override
  _FunctionAllIn createState() => _FunctionAllIn();
}

class _FunctionAllIn extends State<FunctionAllIn> {
  @override
  Widget build(BuildContext context) {
    // 配合上面提到的错误，写在这里才起作用
    final routeList = RoteList().entries;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: routeList.length,
      itemBuilder: (BuildContext context, int index) {
        final entry = routeList[index].entries.toList();
        final String title = entry[0].key;
        final PageRoute value = entry[0].value;
        return Align(
          key: Key(title),
          alignment: Alignment.center,
          child: Container(
            width: 200,
            child: RaisedButton(
              color: title.contains('Material') ? Colors.yellow : Colors.blue,
              child: Text(title),
              onPressed: () {
                return Navigator.of(context).push(value);
              },
            ),
          ),
        );
      },
    );
  }
}
