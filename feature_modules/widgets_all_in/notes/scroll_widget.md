# ScrollView

## ListView

### ListView width

ListView 里面的 child 宽度不生效

```dart
ListView(
    children: <Widget>[
    Container(
        width: 200, // width 不起作用
        height: 50,
        color: Colors.red,
        child: Container(
        child: Text('Entry A'),
        color: RandomColor().randomColor(),
        ),
    ),
    // Align 给了 Container 宽度约束，所以这里的 width 会生效
    Align(
        child: Container(
        width: 200,
        height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry B')),
        ),
    ),
    ],
)
```

因为父widget没有给Container水平方向约束，所以Container会填充允许的剩余空间

Container的width只是对子widget的约束。

通过 Align 包裹就生效了

参考文件 widget_listView_width.dart

### ListView ScrollController

与 NotificationListener 相比，ScrollController 只能获取当前滚动位置。

### ListView NotificationListener

参考文件 widget_listView_ notificationListener.dart 。

<https://book.flutterchina.club/chapter6/scroll_controller.html>

可滚动组件在滚动时会发送 `ScrollNotification` 类型的通知，ScrollBar正是通过监听滚动通知来实现的。

通过 `NotificationListener` 和 `ScrollController` 有两个主要的不同：

1. 通过NotificationListener可以在从可滚动组件到widget树根之间任意位置都能监听。
而ScrollController只能和具体的可滚动组件关联后才可以。

1. 收到滚动事件后获得的信息不同；NotificationListener在收到滚动事件时，
通知中会携带当前滚动位置和ViewPort的一些信息，而ScrollController只能获取当前滚动位置。

ScrollNotification 提供 `metrics` 属性，它的类型是ScrollMetrics，该属性包含当前ViewPort及滚动位置等信息：

> `metrics.viewportDimension`: 视口尺寸。如果存在 AppBar Widget，视口的尺寸 = 屏幕高度 - AppBar高度

## SliverList & SliverGrid

配合 `CustomScrollView` 使用

无论是 SliverList or SliverGrid 它们的 delegate 只有两种实例 `SliverChildListDelegate` 和 `SliverChildBuilderDelegate`

child 的数量是动态的，不固定的就用 `SliverChildBuilderDelegate` 。

SliverList or SliverGrid 都不能设置宽度

### SliverList

有三种使用方式

- `SliverList`

- `SliverFixedExtentList` 定义 child 在主轴方向的尺寸

- `SliverPrototypeExtentList`, which is similar to SliverFixedExtentList except that it uses a prototype list item instead of a pixel value to define the main axis extent of each item.

### SliverGrid

有三种使用方式

- `SliverGrid` 通过 gridDelegate 属性定义 grid 的类型，有两种:

    `SliverGridDelegateWithMaxCrossAxisExtent` 和 `SliverGridDelegateWithFixedCrossAxisCount`

    和下面的两个实现是一样的

- `SliverGrid.count` 定义 cross axis 方向网格个数

- `SliverGrid.extent` 在保证均等划分 cross axis 的前提下，自动计算 the child 宽度的值将会尽可能接近maxCrossAxisExtent
