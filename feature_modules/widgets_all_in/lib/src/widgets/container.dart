import 'package:platform_sdk/platform_sdk.dart';

/*
注意事项：

  Container 中 color 不能和 decoration 同时使用

  容器的大小可以通过width、height属性来指定，也可以通过constraints来指定；如果它们同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。

  width = padding + content
*/

class WidgetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Container'),
      ),
      body: _Unnormal1(),
    );
  }
}

/// 正常场景下的 Container
class _Normal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text('ContainerOne'),
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          // color: RandomColor().randomColor(),
          width: 100.0,
          height: 100.0,
          // constraints: BoxConstraints.expand(
          //   width: 200,
          //   height: 100,
          // ),
          // constraints: BoxConstraints(
          //   minWidth: 10,
          //   minHeight: 10,
          // ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: RandomColor().randomColor(),
            border: Border.all(
              color: Colors.red,
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}

/// 特殊场景下的 Container
///
/// Container doesn't know the constraints of the Parent,
/// then It try to fill all the space available.
/// https://stackoverflow.com/questions/54225462/flutter-why-is-container-width-not-honoured/54225592
///
/// 这里牵涉到BoxConstraints的底层问题，知乎专栏https://zhuanlan.zhihu.com/p/41801871
/// 这也就解释了因为 ListView的约束，所以上面的Container高度就生效了
/// 下面的width就生效了
/*
  Align(
    alignment: Alignment.center,
    child: Container(
      width: 100,
      height: 100,
      color: Colors.deepOrange,
    ),
  ),
*/
class _Unnormal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.pink,
        ),
      ],
    );
  }
}

/// 特殊场景下的 Container
/// 当 ContainerA 嵌套在 ContainerB 中时，ContainerA 的 width 和 height 属性不起作用
/// https://stackoverflow.com/questions/54717748/why-flutter-container-does-not-respects-its-width-and-height-constraints-when-it
/// 下面这种写法就可以解决上面的问题 参考 https://stackoverflow.com/questions/52157805/flutter-container-inside-a-container/52157893
/*
  Container(
    width: 200.0,
    height: 200.0,
    color: Colors.orange,
    alignment: Alignment.center, // where to position the child
    child: Container(
      width: 50.0,
      height: 50.0,
      color: Colors.blue,
    ),
  ),
*/
class _Unnormal1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Container(
        width: 10,
        height: 10,
        color: Colors.blue,
      ),
    );
  }
}
