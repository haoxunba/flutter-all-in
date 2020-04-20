# Class

## Extending a class

Use `extends` to create a subclass, and `super` to refer to the superclass:

```dart
class Television {
  void turnOn() {
  }
  // ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
  }
  // ···
}
```

Subclasses can override instance methods, getters, and setters.

使用 `@override` 注释，表示有意要覆盖的成员

```dart
class SmartTelevision extends Television {
  @override
  void turnOn() {...}
  // ···
}
```

### Extending a StatefulWidget

会执行父类的 initState 和 build 等方法，demo：dart_extends.dart

## Annotation

### @override

The annotation `@override` marks an instance member as overriding a superclass member with the same name.

`@override` 主要用在抽象类，接口类，extend继承类

`@override` 仅起到注释的作用，可以不写，但是为了代码可读性一般推荐是写上的

### protected

protected 定义的方法，只能在当前类或者继承的子类去调用，参考demo: dart_extends.dart

Indicates that m should only be invoked from instance methods of C or classes that extend, implement or mix in C, either directly or indirectly. Additionally indicates that m should only be invoked on this, whether explicitly or implicitly.

## extends implements mixins

三个关键字之间的区别

| 关键字 | extends | implements | with  |
|  ----  | ----  | ----  | ----  |
| 应用场景  | 所有类 | 接口  | Mixi类 |
| 单元格  | 单元格 | 单元格  | 单元格 |
