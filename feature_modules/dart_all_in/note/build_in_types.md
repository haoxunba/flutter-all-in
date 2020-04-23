# Dart-Build-int-ypes

## Iterable

### Iterable\<E> class

A collection of values, or "elements", that can be accessed sequentially.

The `List` and `Set` classes are both Iterable

### Iterable Properties

- `isEmpty → bool`

Returns true if there are no elements in this collection.

### Iterable Methods

- `map<T>(T f(E e)) → Iterable<T>`

Returns a new lazy Iterable with elements that are created by calling `f` on each element of this Iterable in iteration order.

- `toList({bool growable: true }) → List<E>`

Creates a List containing the elements of this Iterable. 一般用来将 Iterable 类型转换成 List 类型

将 Map 类型转换成 List 类型

```dart
main() {
  final a = <String, String>{};
  print(a); // {}
  a['name'] = 'xiaoming';
  a['age'] = '18';
  print(a.values); // ('xiaoming', '18')
  final b = a.values.toList();
  print(b); // ['xiaoming', '18']
}
```

## Lists

> 所有属性和方法都继承自 `Iterable`

## Sets

> 所有属性和方法都继承自 `Iterable`

set 是一个无序的对象集，每个 item 都是不相同的，独一无二的。

Dart 通过 set literals(字面量) 和 Set type 来提供sets

```dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

// 等同于 set literals(字面量)

var halogens = <String>{'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

// 等同于 Set type

Set<String> halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
```

Set 和 Map 区别

```dart
var names = <String>{};
// Set<String> names = {}; // This works, too.
// var names = {}; // Creates a map, not a set.
```

通过 const 创建编译时常量 Set

```dart
final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // Uncommenting this causes an error.
```

## Maps

### [Map<K, V> class](https://api.dart.dev/stable/2.7.1/dart-core/Map-class.html)

所有的 Map 都是 Map class 的实例，因此 Map 中的属性和方法都是来自于这个类

### Maps Properties

- `Iterable<MapEntry<K, V>> entries`

- `bool isEmpty`

- `bool isNotEmpty`

- `Iterable<V> values`

The values of this. The values are iterated in the order of their corresponding keys

```dart
final a = <String, String>{};
print(a); // {}
a['name'] = 'xiaoming';
a['age'] = '18';
print(a.values); // ('xiaoming', '18')
```

### Maps Methods

- `addAll(Map<K, V> other) → void`

Adds all key/value pairs of other to this map.

## null-aware operators 空感知操作符

- ??=

类似于 a === null ? a = 3 : a;

```dart
int a; // The initial value of a is null.
a ??= 3;
print(a); // <-- Prints 3.

a ??= 5;
print(a); // <-- Still prints 3.
```

- ??

类似于 a === null ? 3 : a;

注意??和??=的区别是赋值的动作

```dart
print(1 ?? 3); // <-- Prints 1.
print(null ?? 12); // <-- Prints 12.
```

- ?.

类似于obj === null ? null : obj.method();

```dart
obj?.method();
```

reference <http://blog.sethladd.com/2015/07/null-aware-operators-in-dart.html>
