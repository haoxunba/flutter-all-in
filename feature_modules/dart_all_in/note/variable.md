# Variable 变量

`var name = 'Bob';`

变量仅存储对象引用，这里的变量是 name 存储了一个 String 类型的对象引用。 “Bob” 是这个 String 类型对象的值。

未被初始化的值都是 null ，即使已经指定类型如 int ，他的默认值也是 null ，因为所有变量都是 object。

Final 变量的值只能被设置一次； Const 变量在编译时就已经固定。

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



#### Final Advance

reference <https://stackoverflow.com/questions/50431055/what-is-the-difference-between-the-const-and-final-keywords-in-dart>

final should be used over const if you don't know the value at compile time, and it will be calculated/grabbed at runtime. If you want an HTTP response that can't be changed, if you want to get something from a database, or if you want to read from a local file, use final. Anything that isn't known at compile time should be final over const.

> With all of that being said, both const and final cannot be reassigned, but fields in a final object, as long as they aren't const or final, can be reassigned (unlike const).

```dart
final a = <String, String>{};
print(a); // {}
a['name'] = 'xiaoming';
print(a); // {'name': 'xiaoming'}
```

> Note：不能改变 final 定义的变量值是指不能改变变量的内存地址

### Const

Use const for variables that you want to be compile-time constants. **If the const variable is at the class level, mark it static const.** 

```dart
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere
```

```dart
Class A {
  static const a = 5;
}
```

除了上面的用法，通过 const 声明 constructor 再配合所有字段都是 final 声明的，这样可以保证对象不可变。

```dart
Class A {
    final a, b;
    const A(this.a, this.b);
}

void main () {
    // There is no way to change a field of object once it's 
    // initialized.
    const immutableObja = const A(5, 6);
    // Uncommenting below statement will give compilation error.
    // Because you are trying to reinitialize a const variable
    // with other value
    // immutableObja = const A(7, 9);

    // But the below one is not the same. Because we are mentioning objA 
    // is a variable of a class A. Not const. So we can able to assign
    // another object of class A to objA.
    A objA = const A(8, 9);
    // Below statement is acceptable.
    objA = const A(10, 11);
}
```

除了像上面用 const 声明某个变量是常量之外，还可以创建**常量的值( value )**赋值给某个变量

如，在 List 字面量之前添加 const 关键字，可以定义 List 类型的编译时常量：

```dart
var constantList = const [1, 2, 3];
// constantList[1] = 1; // 取消注释会引起错误。
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
