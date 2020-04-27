# Flutter-Test

## 分类

在Flutter中，自动化测试（Automated testing）分成下面三类

- `Unit Test` tests a single function, method, or class.

- `Widget Test` (in other UI frameworks referred to as component test) tests a single widget.

- `Integration Test(集成测试)` tests a complete app or a large part of an app.

## Unit Test

测试目标：验证被测试单元在各种条件下（如if..else...）的正确性。

单元测试特点：

1. 依赖程度少。被测单元的外部依赖需要被mock。
2. 执行速度快。单元测试不会读写磁盘，也不会将数据渲染到屏幕（纯代码层测试，不会涉及UI层）。如果数据需要用户通过UI界面输入，都是采用mock数据。

### `test` package

The `test` package provides the core framework for writing unit tests, and the `flutter_test` package provides additional utilities for testing widgets.

`test` package 官方文档 <https://pub.dev/packages/test>

基本语法框架

```dart
void main() {
    test('description', () {
        // 逻辑处理
        ...
        // 前后语句结果相等则通过test
        expect(执行语句，期望执行语句的结果);
    })
}
```

reference：[Flutter官网简单应用案例](https://flutter.cn/docs/cookbook/testing/unit/introduction)

You can use the `setUp()` and `tearDown()` functions to share code between tests. The `setUp()` callback will run before **every test** in a group or test suite, and `tearDown()` will run after. `tearDown()` will run even if a test fails, to ensure that it has a chance to clean up after itself.

## Integration tests

测试目标：集成测试的目标是验证正在测试的所有 widget 和服务是否按照预期的方式一起工作。此外，还可以使用集成测试来验证应用的性能（performance）。

集成测试需要实现两个功能：

1. deploy an instrumented application(可测试应用程序) to a real device or emulator

2. 利用独立的测试套件（test suite）去驱动应用程序（drive apps）

`flutter_driver`依赖包可以实现上面两个步骤，因此集成测试需要依赖`flutter_driver`

> Also add the `test` dependency in order to use actual test functions（实际测试函数） and assertions(断言).

### `flutter_driver` package

因为集成测试的两个功能不是应用在一个进程（process）内，因此需要创建两个文件分别实现两个功能

reference <https://flutter.cn/docs/cookbook/testing/integration/introduction>

1. `test_driver/app.dart`

    该文件实现**安装测试应用程序**，基本格式如下：

    ```dart
    import 'package:flutter_driver/driver_extension.dart';
    import 'package:counter_app/main.dart' as app;

    void main() {
        // This line enables the extension.
        enableFlutterDriverExtension();

        // Call the `main()` function of the app, or call `runApp` with
        // any widget you are interested in testing.
        app.main();
    }
    ```

1. `test_driver/app_test.dart`

    该文件属于测试套件，包含测试主要逻辑
