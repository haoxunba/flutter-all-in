# JSON 序列化

## 使用 dart:convert 手动序列化 JSON 数据

通过 `dart:convert` 提供的 `jsonDecode(jsonString)` 方法来解码 json 字符串

通过 `dart:convert` 提供的 `jsonEncode(json)` 方法来编码 json

> 解码：指将 json 字符串转换成 `Map<String, dynnamic>` 类型的 json 对象
> 编码：指将 `Map<String, dynnamic>` 类型的 json 对象转换成 json 字符串

```dart
// json 对象
{"name": "John Smith","email": "john@example.com"}
// json 字符串
'{"name": "John Smith","email": "john@example.com"}'
```

### 自定义模型类

因为 `jsonDecode()` 返回一个 `Map<String, dynamic>` , 因为是 dynamic 类型，无法确定 value 的数据类型。

自定义模型类可以定义 value 的数据类型。

```dart
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'email': email,
    };
}
```
