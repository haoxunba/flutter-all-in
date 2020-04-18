# Bloc All In

## BlocListner

### condition

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
