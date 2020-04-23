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
            ScrollMetrics metrics = notification.metrics;
            print(metrics.pixels); // 当前位置
            print(metrics.atEdge); //是否在顶部或底部
            print(metrics.axis); //垂直或水平滚动
            print(metrics.axisDirection); // 滚动方向是down还是up
            print(metrics.extentAfter); //视口底部距离列表底部有多大
            print(metrics.extentBefore); //视口顶部距离列表顶部有多大
            print(metrics.extentInside); //视口范围内的列表长度
            print(metrics.maxScrollExtent); //最大滚动距离，列表长度-视口长度
            print(metrics.minScrollExtent); //最小滚动距离
            print(metrics.viewportDimension); //视口长度
            print(metrics.outOfRange); //是否越过边界
            print('------------------------');
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
