# Navigator

## 基础导航

```dart
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => _WidgetNavigatorBasicSecondRoute()),
);
```

```dart
Navigator.pop(context);
```

## 命名路由

需要现在 MaterialApp 配置路由信息，一般有两种方式 `onGenerateRoute` 和 `routes`

> 如果 MaterialApp 同时有 onGenerateRoute 和 routes 两个属性，那么在匹配路由的时候，会先匹配 routes 中的路由，如果 routes 没有对应的路由，才会去 onGenerateRoute 中匹配路由。但是一般情况下，两者不会同时使用。具体案例参考 navigator/widget_navigator_with_arguments.dart

然后

```dart
Navigator.pushNamed(context, '/second');
```

## Navigator.of(context)

### rootNavigator

```dart
  static NavigatorState of(
    BuildContext context, {
    bool rootNavigator = false,
    bool nullOk = false,
  }) {
    final NavigatorState navigator = rootNavigator
        ? context.findRootAncestorStateOfType<NavigatorState>()
        : context.findAncestorStateOfType<NavigatorState>();
    assert(() {
      if (navigator == null && !nullOk) {
        throw FlutterError(
          'Navigator operation requested with a context that does not include a Navigator.\n'
          'The context used to push or pop routes from the Navigator must be that of a '
          'widget that is a descendant of a Navigator widget.'
        );
      }
      return true;
    }());
    return navigator;
  }
```

`rootNavigator = false` 表示 NavigatorState 默认使用的是最近的祖先创建的 NavigatorState 。

`rootNavigator = true` 表示使用最远的祖先创建的 NavigatorState。

通常我们会在 widget tree 顶层用 MaterialApp or WidgetsApp. 他们都可以创建 NavigatorState 。

> <https://stackoverflow.com/questions/44004451/navigator-operation-requested-with-a-context-that-does-not-include-a-navigator>
>
> If MaterialApp [home], [routes], [onGenerateRoute], and [onUnknownRoute] are all null,and [builder] is not null, then no [Navigator] is created.

```dart
// from class _MaterialAppState extends State<MaterialApp>
void _updateNavigator() {
  if (widget.home != null ||
      widget.routes.isNotEmpty ||
      widget.onGenerateRoute != null ||
      widget.onUnknownRoute != null) {
    _navigatorObservers = List<NavigatorObserver>.from(widget.navigatorObservers)
      ..add(_heroController);
  } else {
    _navigatorObservers = const <NavigatorObserver>[];
  }
}
// MaterialApp 是继承自 WidgetsApp
// 所以最终都是在 WidgetsApp 创建 NavigatorState
if (_navigator != null) {
  navigator = Navigator(
    key: _navigator,
    // If window.defaultRouteName isn't '/', we should assume it was set
    // intentionally via `setInitialRoute`, and should override whatever
    // is in [widget.initialRoute].
    initialRoute: WidgetsBinding.instance.window.defaultRouteName != Navigator.defaultRouteName
        ? WidgetsBinding.instance.window.defaultRouteName
        : widget.initialRoute ?? WidgetsBinding.instance.window.defaultRouteName,
    onGenerateRoute: _onGenerateRoute,
    onUnknownRoute: _onUnknownRoute,
    observers: widget.navigatorObservers,
  );
}
```

### Navigator.push 和 Navigator.of(context).push

```dart
@optionalTypeArgs
static Future<T> push<T extends Object>(BuildContext context, Route<T> route) {
    return Navigator.of(context).push(route);
}
```

根据上面源码，下面的两个用法是相等的

```dart
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => _WidgetNavigatorBasicSecondRoute()),
);
```

```dart
Navigator.of(context).push(
    MaterialPageRoute(
        builder: (context) => _WidgetNavigatorBasicSecondRoute()),
);
```
