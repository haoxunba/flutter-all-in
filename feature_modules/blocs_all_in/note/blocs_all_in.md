# Bloc All In

## BlocListner

### condition

condition 是可选属性

The `condition` function will be invoked on each `bloc` `state` change.

The `condition` takes the previous `state` and current `state` and must return a `bool`,which determines whether or not the `listener` function will be invoked.

The previous `state` will be initialized to `state` when the `BlocListenerBase` is initialized.

`condition` is optional and if it isn't implemented, it will default to `true`.

这里有一个坑，previous 的 state 只有在 condition 的判断为 true 时，才会更新。否则 previous 会一直是 initialState。

```dart
condition: (previous, current) {
    // 根据源码 BlocListenerBase 了解到，只有返回值为 ture ， 才会更新 previous.value ，
    // 否则 previous.value 就一直是初始化的值。
    return previous.value == 0;
},
```

对应源码

```dart
class _BlocListenerBaseState<B extends Bloc<dynamic, S>, S> extends State<BlocListenerBase<B, S>> {
  void _subscribe() {
    if (_bloc != null) {
      _subscription = _bloc.skip(1).listen((S state) {
        if (widget.condition?.call(_previousState, state) ?? true) {
          widget.listener(context, state);
          _previousState = state;
        }
      });
    }
  }
}
```

## BlocProvider

创建 flutter bloc 提供 BlocProvider

> `BlocProvider.value` 不能创建 bloc，只能提供 bloc，详情见 [BlocProvider.value](#BlocProvider.value)

在大多数情况下，应使用 BlocProvider 创建新的bloc，这些bloc将可用于其余子树。在这种情况下，由于 BlocProvider 负责创建bloc，因此它将自动处理关闭bloc。

```dart
BlocProvider<BlocA>(
    create: (BuildContext context) => BlocA(),
    child: ChildA(),
);
```

然后 The `child` which will have access to the bloc via `BlocProvider.of(context)`

## BlocProvider.value

不能自动关闭，主要用于路由作为参数传递，参考demo bloc_value.dart

Takes a [bloc] and a [child] which will have access to the [bloc] via `BlocProvider.of(context)`.

When `BlocProvider.value` is used, the [bloc] will not be automatically closed.

As a result, `BlocProvider.value` should mainly be used for providing existing [bloc]s to new routes.

A new [bloc] should not be created in `BlocProvider.value`.

[bloc]s should always be created using the default constructor within [create].

## MultiBlocProvider

整合多个 BlocProvider ，解决多层嵌套代码可读性差的问题。

```dart
BlocProvider<BlocA>(
  create: (BuildContext context) => BlocA(),
  child: BlocProvider<BlocB>(
    create: (BuildContext context) => BlocB(),
    child: BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
      child: ChildA(),
    )
  )
)
```

ChildA 依赖多个 Bloc

```dart
MultiBlocProvider(
  providers: [
    BlocProvider<BlocA>(
      create: (BuildContext context) => BlocA(),
    ),
    BlocProvider<BlocB>(
      create: (BuildContext context) => BlocB(),
    ),
    BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
    ),
  ],
  child: ChildA(),
)
```

> 这里有一个坑，当使用 MultiBlocProvider 时，BlocProvider 必须写范型，如 `BlocProvider<BlocA>()`
> 如果不写范型 `BlocProvider()` ，编译时报错，提示找不到对应的 bloc
