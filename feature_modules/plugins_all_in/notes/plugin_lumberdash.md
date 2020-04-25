# Plugin Lumberdash

提供多个 api 实现 不同的 log 种类，比如 `logWarning()` `logFatal()` `logMessage()` `logError()`

可以拓展对应的 api 来自定义自己的 log 。

## LumberdashClient

通过 `LumberdashClient` 提供多种 log 主题。

```dart
putLumberdashToWork(withClients: [ColorizeLumberdash()]);
```

`ColorizeLumberdash` 等主题是通过另外的插件提供的，目前有下面四个插件，因为 `withClients` 的值是数组，所以可以多个插件组合使用

- `colorize_lumberdash` 目前控制台不能转译颜色 `flutter: \^[[38;5;0m\^[[48;5;3m[WARNING] Hello Warning<…>`

- `firebase_lumberdash`

- `print_lumberdash` 常用，控制台输出 `flutter: [WARNING] Hello Warning`

- `file_lumberdash` 常用，将 log 日志存储到指定的 path 中。

- `sentry_lumberdash`

### file_lumberdash

```dart
putLumberdashToWork(
    withClients: [
        FileLumberdash(filePath: yourFilePath)
    ],
);
```

`yourFilePath` 可以通过 `path_provider` 插件获取路径，然后拼接自定义的文件名就可以了

具体实现步骤：

1. `path_provider` 通过 `getExternalStorageDirectory()` 获取 android 路径，或者 `getApplicationDocumentsDirectory` 获取 ios 路径对象

2. 获取上面对象的 path 属性值

3. 将上面的路径拼接自定义文件名就是 `yourFilePath` 比如 `'${fileDirectory.path}/$region-$environment-logs.txt'`

## Ref

<https://pub.dev/packages/lumberdash>
