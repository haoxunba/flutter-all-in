# Widgets RenderObjects Elements

为了形象化解释，本文用 Opacity Widget 举例。

继承关系 `Opacity → SingleChildRenderObjectWidget → RenderObjectWidget → Widget`

## Widgets

A widget only holds the configuration information.

> This is the reason why you can create new widget every time the build function is called. Because the widgets are not expensive to construct. They are merely containers for information.

## RenderObjects

执行 rendering 渲染事件

还是以 Opacity Widget 为例，下面是部分 Opacity 源码

```dart
@override
RenderOpacity createRenderObject(BuildContext context) {
  return RenderOpacity(
    opacity: opacity,
    alwaysIncludeSemantics: alwaysIncludeSemantics,
  );
}

@override
void updateRenderObject(BuildContext context, RenderOpacity renderObject) {
  renderObject
    ..opacity = opacity
    ..alwaysIncludeSemantics = alwaysIncludeSemantics;
}
```

上面的 `RenderOpacity` 通过继承 `RenderProxyBox` to implement all the methods (for example performing layout/ hit testing/ computing sizes) and ask its child to do the actual work. And deferring the actual calculation to the only child.

```dart
class RenderOpacity extends RenderProxyBox {
  double get opacity => _opacity;
  double _opacity;
  set opacity(double value) {
    _opacity = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
      context.pushOpacity(offset, _alpha, super.paint);
  }
}
```
