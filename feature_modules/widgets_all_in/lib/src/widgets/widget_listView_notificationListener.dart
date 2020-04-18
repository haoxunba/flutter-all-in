import 'package:flutter/material.dart';

class WidgetListViewNotificationListenerPage extends StatefulWidget {
  @override
  _WidgetListViewNotificationListenerPageState createState() =>
      new _WidgetListViewNotificationListenerPageState();
}

class _WidgetListViewNotificationListenerPageState
    extends State<WidgetListViewNotificationListenerPage> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ListView'),
      ),
      body: Scrollbar(
        //进度条
        // 监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            // 属性说明参考 md 文件
            print(
                'notification.metrics.pixels: ${notification.metrics.pixels}');
            print(
                'notification.metrics.maxScrollExtent: ${notification.metrics.maxScrollExtent}');
            print(
                'notification.metrics.extentBefore: ${notification.metrics.extentBefore}');
            // extentInside ：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。不包括 AppBar 的高度
            print(
                'notification.metrics.extentInside: ${notification.metrics.extentInside}');
            print(
                'notification.metrics.extentAfter: ${notification.metrics.extentAfter}');
            print(
                'notification.metrics.atEdge: ${notification.metrics.atEdge}');
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            //return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("$index"));
                  }),
              CircleAvatar(
                //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}
