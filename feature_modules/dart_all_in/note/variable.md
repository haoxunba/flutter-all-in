# Variable 变量

`var name = 'Bob';`

**Variables store references. The variable called name contains a reference to a String object with a value of “Bob”.**

## Default value

未被初始化的值都是 null ，即使已经指定类型如 int ，他的默认值也是 null ，因为所有变量都是 object。

```dart
int lineCount;
assert(lineCount == null);
```

> Note: Production code ignores the `assert()` call.

## Final and const

If you never intend to change a variable, use final or const, either instead of var or in addition to a type. A final variable can be set only once; a const variable is a compile-time constant. **Const variables are implicitly final.**

### Final

> Note: Instance variables can be final but not const. Final instance variables must be initialized before the constructor body starts — at the variable declaration, by a constructor parameter, or in the constructor’s initializer list.

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

You can’t change the value of a final variable:

`name = 'Alice'; // Error: a final variable can only be set once.`

```dart
final a = <String, String>{};
print(a); // {}
a['name'] = 'xiaoming';
print(a); // {'name': 'xiaoming'}
```

> Note：不能改变 final 定义的变量值是指不能改变变量的内存地址

#### Final Advance

reference <https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart>

final should be used over const if you don't know the value at compile time, and it will be calculated/grabbed at runtime. If you want an HTTP response that can't be changed, if you want to get something from a database, or if you want to read from a local file, use final. Anything that isn't known at compile time should be final over const.

> With all of that being said, both const and final cannot be reassigned, but fields in a final object, as long as they aren't const or final, can be reassigned (unlike const).

### Const

Use const for variables that you want to be compile-time constants. **If the const variable is at the class level, mark it static const.** Where you declare the variable, set the value to a compile-time constant such as a number or string literal, a const variable, or the result of an arithmetic operation on constant numbers:

```dart
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere
```

The const keyword isn’t just for declaring constant variables. You can also use it to create constant values, as well as to declare constructors that create constant values. Any variable can have a constant value.

```dart
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

You can omit const from the initializing expression of a const declaration, like for `baz` above.

You can change the value of a non-final, non-const variable, even if it used to have a const value:

```dart
foo = [1, 2, 3]; // Was const []
```

You can’t change the value of a const variable:

```dart
bar = [42]; // Error: Setter not found: 'bar'.
baz = [42]; // Error: Constant variables can't be assigned a value.
```

#### Const Advance

reference <https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart>

You can use it when creating collections, like `const [1, 2, 3]`, and when constructing objects (instead of new) like `const Point(2, 3)`. Here, const means that the object's entire deep state can be determined entirely at compile time and that the object will be frozen(冻结) and completely immutable.

Const 规则:

They must be created from data that can be calculated at compile time. A const object does not have access to anything you would need to calculate at runtime. `1 + 2` is a valid const expression, but `new DateTime.now()` is not.

They are deeply, transitively immutable. If you have a final field containing a collection, that collection can still be mutable. If you have a const collection, everything in it must also be const, recursively.

They are 规范化的. This is sort of like string interning: for any given const value, a single const object will be created and re-used no matter how many times the const expression(s) are evaluated. In other words:

```dart
getConst() => const [1, 2];
main() {
  var a = getConst();
  var b = getConst();
  print(a === b); // true
}
```

```dart
var constantList = const [1, 2, 3];
constantList[0] = 1; // error 因为：const 定义的 collection 类型的变量，内部的所有值都是 const
```

```dart
var constantList = const [1, 2, 3];
constantList = [1]; // no error  因为：constantList 是 var 定义的，可以重新赋值
```

```dart
var constantList = const [1, 2, 3];
constantList = [1];
constantList[0] = 1; // no error
```

```dart
var constantList = [1, 2, 3];
constantList[0] = 1; // no error
```

As of Dart 2.5, you can define constants that use `type checks and casts` (is and as), `collection if`, and `spread operators` (... and ...?):

```dart
// Valid compile-time constants as of Dart 2.5.
const Object i = 3; // Where i is a const Object with an int value...
const list = [i as int]; // Use a typecast.
const map = {if (i is int) i: "int"}; // Use is and collection if.
const set = {if (list is List<int>) ...list}; // ...and a spread.
```
