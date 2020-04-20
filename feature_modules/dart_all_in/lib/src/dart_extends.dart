import 'package:platform_sdk/platform_sdk.dart';

abstract class DartExtendsPageSuper extends StatefulWidget {
  // 必须用 @protected ，
  @protected
  // 这里定义 build 是为了给子类 DartExtendsPage 提供
  // 否则，子类在使用 override 时会提示找不到对应父类的
  Widget build(BuildContext context);
  @override
  _DartExtendsPageSuperState createState() => _DartExtendsPageSuperState();
}

class _DartExtendsPageSuperState extends State<DartExtendsPageSuper> {
  @override
  void initState() {
    super.initState();
    // 子类继承的时候，initState执行了
    print('initState');
  }

  @override
  Widget build(BuildContext context) => widget.build(context);

  // 如果像下面的写法，页面就只显示下面的 widget，不会显示 继承类 DartExtendsPage 的 widget

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("DartExtendsPageSuper Widget"),
  //     ),
  //     body: Text('DartExtendsPageSuper'),
  //   );
  // }
}

class DartExtendsPage extends DartExtendsPageSuper {
  @override
  Widget build(BuildContext context) {
    // 这里没有渲染，渲染的是 extends 的widget
    return Scaffold(
      appBar: AppBar(
        title: Text("DartExtendsPage Widget"),
      ),
      body: Center(
        child: Text('DartExtendsPage'),
      ),
    );
  }
}
