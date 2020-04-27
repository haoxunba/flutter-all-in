# Widget Test

测试目标：验证widget的UI表现和交互行为

必须添加`flutter_test`依赖

基本语法框架

```dart
void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
```

## testWidgets()

`testWidgets()` 函数代替test package提供的 `test()` 函数，可以为**每个**测试创建一个 `WidgetTester` 。

## WidgetTester

`WidgetTester` 可在测试环境下建立 widget 并与其交互。

- 建立widget

通过 `pumpWidget()` 初始化测试环境widget，如果使用 `StatefulWidget` 或动画需要*重建相同*的 widget ，可以使用 `tester.pump()` 或 `tester.pumpAndSettle()` 。

- 交互

例如通过 `tester.enterText(Finder finder, String text)` 给输入框添加内容

### WidgetTester Methods

#### `tester.pumpWidget()`

初始化测试环境widget

#### `tester.pump()`

在一段给定时间后重建 widget。

```dart
await tester.pump(Duration(milliseconds: 200));
```

#### `tester.pumpAndSettle()`

在给定期间内不断重复调用 pump 直到完成所有绘制帧。一般需要等到所有动画全部完成。
常用对于 StatefulWidget 都会在初始化 widget 之后调用

```dart
await tester.pumpWidget(widgetUnderTest);
await tester.pumpAndSettle();
```

> pumpWidget 和 pump 和 pumpAndSettle 都是异步，都需要 await 关键字

- `tester.runAsync()`

Runs a callback that performs real asynchronous work.

```dart
testWidgets(
    'opens the FavoriteDestinations page when the tapping the FavoritesButton',
    (tester) async {
        await tester.pumpWidget(widgetUnderTest);
        await tester.pumpAndSettle();
        await tester.runAsync(() async {
            await tester.tap(find.byKey(Key('destinationsTab_favoritesButton')));
            await tester.pump();
            await tester.pump();
            expect(find.byType(FavoritesPage), findsOneWidget);
        });
});
```

- `tester.widget()`

The matching widget in the widget tree. 通常配合 `as` 类型断言使用

```dart
final vehicleFinderIconButtonVisibility = tester.widget(
        vehicleFinderIconButtonFinder,
      ) as Visibility;

var map = tester.widget(find.byType(DestinationsMap)) as DestinationsMap;
```

- `tester.getCenter()`

获取当前 widget 的中心点

```dart
Offset getCenter (
  Finder finder
)
```

- `tester.getTopLeft()`

获取当前 widget 的左上角点，一般用来获取 AppBar 的返回位置

```dart
Offset getTopLeft (
  Finder finder
)
```

- `tester.tapAt()`

Dispatch a pointer down / pointer up sequence at the given location.

```dart
Future<void> tapAt (
  Offset location,
  {int pointer,
  int buttons: kPrimaryButton}
)
```

- `tester.state()`

The matching state in the widget tree.

```dart
T state <T extends State<StatefulWidget>>(
  Finder finder
)
```

- `tester.startGesture()`

创建一个以 downLocation 位置初始向下的手势，并返回 [TestGesture](https://api.flutter-io.cn/flutter/flutter_test/TestGesture-class.html) 对象，从而方便继续进行手势操作

```dart
Future<TestGesture> startGesture (
  Offset downLocation,
  {int pointer,
  PointerDeviceKind kind: PointerDeviceKind.touch,
  int buttons: kPrimaryButton}
)
```

```dart
// 案例
Future doGesture(WidgetTester tester, double dy) async {
  final gesture = await tester
      .startGesture(tester.getCenter(find.byKey(Key('joy_tray_appbar'))));
  await gesture.moveBy(Offset(0.0, dy));
  await gesture.up(); // End the gesture by releasing the pointer.
  await tester.pumpAndSettle();
}
await doGesture(tester, -200); // 向上移动200
```

### WidgetTester reference

[Flutter官网介绍](https://flutter.cn/docs/cookbook/testing/widget/tap-drag)

[WidgetTester Class](https://api.flutter-io.cn/flutter/flutter_test/WidgetTester-class.html)

### Finder

`Finder` 类提供了在测试环境下查找 widgets 的方法.

通过 `flutter_test` 提供的全局方法 find 来实现 `Finder` 类，如 `find.text('T')` 。

reference [Flutter-Finder官网介绍](https://flutter.cn/docs/cookbook/testing/widget/finders)

可以到 [CommonFinders](https://api.flutter-io.cn/flutter/flutter_driver/CommonFinders-class.html) 文档查找 find 更多用法

- `find.text(string)` 查找含有特定文本的 text widget

- `find.byKey()` 通过已经提供给 Widget 的 Key 来查找 Widget
  注意是 `Key()` 包裹的参数

  ```dart
  find.byKey(Key('destinationCard_success_card')),
  ```

- `find.byWidget()` 我们有时会需要查找 Widget 的具体实例。

    比如，当需要确保含有 child 属性的 Widget 渲染 child Widget。

    ```dart
    testWidgets('finds a specific instance', (WidgetTester tester) async {
        final childWidget = Padding(padding: EdgeInsets.zero);

        // Provide the childWidget to the Container.
        await tester.pumpWidget(Container(child: childWidget));

        // Search for the childWidget in the tree and verify it exists.
        expect(find.byWidget(childWidget), findsOneWidget);
    });
    ```

    有的时候会通过 key 来查找 widget，从而能够使用 wighet 实例的方法

    ```dart
    // 封装
    T getWidgetByKey<T extends Widget>(WidgetTester tester, String key) {
      var finder = find.byKey(Key(key));

      if (finder.evaluate().isEmpty) return null;

      return tester.widget<T>(finder);
    }
    ```

## expectLater()

验证 the bloc 按照顺序 emit the expected states

```dart
final expected = [
  DestinationsState.initial(),
  DestinationsState.initial().copyWith(
    // coding
  ),
  DestinationsState.initial().copyWith(
    // coding
  ),
];
expectLater(destinationsBloc, emitsInOrder(expected));
```

## Matchers

`expect(titleFinder, findsOneWidget);`

通过 `flutter_test` package 提供的 `Matcher` 常量，能够在测试环境下帮助我们验证 Finder 是否定位到一个或多个 widgets。如`findsOneWidget`

- `findOneWidget` 在屏幕中只出现一次

- `findsNothing` 验证没有可被查找的 widgets。

- `findsWidgets` 验证一个或多个 widgets 被找到。

- `findsNWidgets` 验证特定数量的 widgets 被找到。

- `isTrue` 验证布尔值 true。

- `isFalse` 验证布尔值 false。

- `isNull` A matcher that matches any null value.
