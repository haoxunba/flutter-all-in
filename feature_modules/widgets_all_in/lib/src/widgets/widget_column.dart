import 'package:platform_sdk/platform_sdk.dart';

class WidgetColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Widget"),
      ),
      body: Column(
        children: <Widget>[
          /// 下面注释代码会在编译时报错
          /// 发生这种情况的一个常见原因是
          /// 当该 Column 已放置在另一个 Column 中
          ///（里面一层的 Column 没有使用Expanded或Flexibleb包裹）。
          /// 当 Column 布置其非灵活子级（那些在其外围既没有扩展 Expanded 又没有灵活度 Flexible 的子级）时，
          /// 它将为他们提供无限制的约束，以便他们可以确定自己的尺寸
          ///（传递无边界的约束 unbounded constraints 通常会向子项发出信号，表明应该收缩包装 shrink-wrap 其内容）。
          /// 在这种情况下，解决方案通常是将内部 Column 包裹在 Expanded 中，
          /// 以表明它应该占用外部 Column 的剩余空间 remaining space ，而不是允许其占用任何所需的空间。
          /// https://api.flutter-io.cn/flutter/widgets/Column-class.html
          // Column(
          //   children: <Widget>[
          //     Expanded(
          //       child: Container(
          //         width: 200,
          //         height: 200,
          //         color: Colors.grey,
          //       ),
          //     ),
          //   ],
          // ),
          /// 显示此消息的另一个原因是
          /// 将Column嵌套在ListView或其他垂直滚动栏中。
          /// 在那种情况下，确实有无限的垂直空间（垂直滚动列表的整个要点是允许垂直的无限空间）。
          /// 在这种情况下，通常值得研究为什么内部Column应该有一个Expanded或Flexible子代：
          /// 内部子代的实际大小是多少？在这种情况下，
          /// 解决方案通常是从内部子项周围删除Expanded或Flexible窗口小部件。
          // Expanded(
          //   child: ListView(
          //     children: <Widget>[
          //       Column(
          //         children: <Widget>[
          //           Expanded(  // 一般这里就不需要Expanded了
          //             child: Container(
          //               width: 200,
          //               height: 200,
          //               color: Colors.yellow,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
