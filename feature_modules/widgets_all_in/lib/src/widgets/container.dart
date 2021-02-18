import 'package:platform_sdk/platform_sdk.dart';

/*
注意事项：

  Container 中 color 不能和 decoration 同时使用
*/

class WidgetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Container'),
      ),
      body: Container(
        child: Text('ContainerOne'),
        padding: EdgeInsets.all(10.0),
        // color: RandomColor().randomColor(),
        decoration: BoxDecoration(
          color: RandomColor().randomColor(),
          border: Border.all(
            color: RandomColor().randomColor(),
            width: 10,
          ),
        ),
      ),
    );
  }
}
