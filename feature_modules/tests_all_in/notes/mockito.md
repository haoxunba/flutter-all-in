# Mockito

通过`Mockito`包mock外部依赖数据，避免外部依赖对测试的影响

**应用在上面提到的`test`基本语法框架里面的逻辑处理部分**

> 外部依赖：unit tests might depend on classes that fetch data from 线上web服务（live web services） or databases.

简单应用案例

```dart
class MockClient extends Mock implements http.Client {}

main() {
  group('fetchPost', () {
    test('returns a Post if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

      expect(await fetchPost(client), const TypeMatcher<Post>());
    });
  }
}
```

## some stubbing(存根)

`when().thenReturn()` or `when().thenThrow()` or `when().thenAnswer()`

### thenReturn and thenAnswer

```dart
// Unstubbed methods return null.
expect(cat.sound(), nullValue);

// Stub a mock method before interacting.
when(cat.sound()).thenReturn("Purr");
expect(cat.sound(), "Purr");
```

Using `thenReturn` to return a Future or Stream will throw an ArgumentError. Instead, use `thenAnswer` to stub methods that return a Future or Stream. 二者仅仅是语法上的区别，起到的作用是一样的。

```dart
// BAD
when(mock.methodThatReturnsAFuture())
    .thenReturn(Future.value('Stub'));
when(mock.methodThatReturnsAStream())
    .thenReturn(Stream.fromIterable(['Stub']));

// GOOD
when(mock.methodThatReturnsAFuture())
    .thenAnswer((_) => Future.value('Stub'));
when(mock.methodThatReturnsAStream())
    .thenAnswer((_) => Stream.fromIterable(['Stub']));
```

## Verifying exact number of invocations / at least x / never

验证调用次数

```dart
cat.sound();
cat.sound();

// Exact number of invocations
verify(cat.sound()).called(2);

// Or using matcher
verify(cat.sound()).called(greaterThan(1));

// Or never called
verifyNever(cat.eatFood(any));
```

## reference

[Flutter官网简单Http请求应用案例](https://flutter.cn/docs/cookbook/testing/unit/mocking)

[Mockito官网](https://pub.flutter-io.cn/packages/mockito)
