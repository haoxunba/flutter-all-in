# Operators

## Type test operators

The `as`, `is`, and `is!` operators are handy for checking types at runtime.

- `as` Typecast (also used to specify library prefixes)

- `is` True if the object has the specified type

- `is!` False if the object has the specified type

The result of `obj is T` is true if obj **implements** the interface specified by T. For example, `obj is Object` is always true.

Use the `as` operator to cast an object to a particular type if and only if you are sure that the object is of that type. Example:

```dart
(emp as Person).firstName = 'Bob';
```

If you aren’t sure that the object is of type T, then use `is T` to check the type before using the object.

```dart
if (emp is Person) {
  // Type check
  emp.firstName = 'Bob';
}
```

> Note: The code isn’t equivalent. If emp is null or not a Person, the first example throws an exception; the second does nothing.

## Cascade notation (..) 级联

Cascades (..) allow you to make a sequence of operations on the same object.

```dart
querySelector('#confirm') // Get an object.
  ..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));
```

等同于

```dart
var button = querySelector('#confirm');
button.text = 'Confirm';
button.classes.add('important');
button.onClick.listen((e) => window.alert('Confirmed!'));
```
