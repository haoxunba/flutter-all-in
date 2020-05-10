# flex

## Flex

A multi-child layout widget that takes multiple children. A `Flex` is flexible in that it can adjust its size based on its children.

The `Flex` is the Widget that `Row` and `Column` extend. They’re the only two Widgets in Flutter that extend `Flex` (as of Flutter 1.0). You could just use a `Flex` directly instead of `Row`/`Column` and set the `AxisDirection` property to up, down, left or right; but that would probably confuse people so maybe you should just stick to using `Row`/`Column`.

> A `Flex` can have any number of `Flexibles` but a `Flexible` can only have one `flex`. And remember, a `Flex` is not a `flex`

### 属性 mainAxisSize

`MainAxisSize.max`: If the `MainAxisSize` is set to max (this is default) the length of the mainAxis of your `Flex` / `Row`/`Column` is going to be as large as its parent will allow it to be.

`MainAxisSize.min`: If the `MainAxisSize.min` is being used, then just add up the lengths of all of its children along the mainAxis. *如果此时外部有约束，则会无视 `MainAxisSize.min` ，会去遵循外部的约束*

### RenderFlex

Flutter 分成 `Widget`, `Element` and `Render` three layers. Many Widget class names have counterparts in the Render layer.

A `Row` or `Column` is just a `Flex` with certain values already hard coded. So, the `Render` layer just uses a `RenderFlex`, then sets the parameters to whatever is needed to make the `Row` or `Column` you want.

## Flexible

A multi-child layout widget but actually won’t take more than one child. 例如 `Expanded` 就是 extends `Flexible`.

If the child of a `Flexible` is too large to fit inside the `Flexible’s` parent, then the child will be resized so it does fit. This is important because it’s an easy way to deal with an `Image` that’s too large and causing an overflow error (the black and yellow bars). Just stuff the image into an `Expanded` and put that `Expanded` into a `Row` or `Column`. Voila! It will be automatically resized to fit in whatever space is available, at runtime, and without you needing to write a bunch of code to do it.

> The easiest way to quickly understand `fit` is if you imagine a balloon inside of a shoe box. The `Flexible` is the balloon and its parent `Flex` (`Column`/`Row`) is the box.

### 属性 flex

根据 flex 的值进行等比例分割 Flex 的剩余空间，在布局计算中，用于约束 Flexiable 。

## FlexFit

Determine how the `Flexible` fits into the `Flex`, determining the size of the `Flex`.

### FlexFit.tight

```dart
Expanded({
  Key key,
  int flex = 1,
  @required Widget child,
  }) : super(
    key: key,
    flex: flex,
    fit: FlexFit.tight,
    child: child,
  );
}
```

`FlexFit.tight` isn’t just going to gently get bigger until it gently touches the edges. It’s going to push to see if it can get its parent to give it more room… and it will push hard (along the main axis) until the parent (`Row`/`Column`) starts enforcing some boundaries and says, “No more. That’s all you get.”

Here’s the funny thing. Our `Flexible` (usually an `Expanded`), is going to have a child. So, you might be wondering how the child’s size gets calculated into all of this.

> You can set the height or width parameter of the child to 1.0 or 100000.0; if the size parameter is along the main axis then it doesn’t matter because it’s going to be ignored. This is because a `Flexible` with `FlexFit.tight` (AKA an `Expanded`) is only concerned about what limitations its parent is placing on its size, not what its child wants.

### Flexiable.loose

Just be as big as the child says it wants to be, just like it didn’t even have a flex.

## Render Flex Children Have Non-Zero Flex

遇到 `RenderFlex children have non-zero flex but incoming height constraints are unbounded.` 这类问题的分析

案例代码 widget_column_column.dart

首先 Column 的默认尺寸是 `mainAxisSize: MainAxisSize.max`，这样能够容纳任意大小的 children

`Flex, Column, Row, SingleChildScrollView and List` 这些 widget 都是依赖其他 widget 来告诉他们的 size 的。

如果 parent widget 没有约束这些 widget ，同时 child widget 又是 infinity ，这时会出现该类型的报错。

## Ref

[Flutter Deep Dive Part 1-4: “RenderFlex children have non-zero flex…](https://medium.com/flutter-community/flutter-deep-dive-part-1-renderflex-children-have-non-zero-flex-e25ffcf7c272)
