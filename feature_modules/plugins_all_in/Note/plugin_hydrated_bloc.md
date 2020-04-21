# hydrated_bloc

hydrated_bloc 导出 `HydratedStorage` 接口，这意味着它可以与任何存储提供程序一起使用。

通过 `HydratedBlocStorage` 类实现了`HydratedStorage` 接口，所以我们可以直接使用 `HydratedBlocStorage` 这个类。

HydratedBlocStorage 构建在 `path_provider` 之上，用于与平台无关的存储层。

开箱即用的存储实现：使用 `HydratedBloc` 上的 `toJson` / `fromJson` 方法读取/写入文件，并且在大多数用例中都应该表现出色（即将发布性能报告）。

此外，尽管HydratedBlocStorage客户端不会自动加密/解密数据，但实现支持加密的自定义HydratedStorage客户端相当简单。

> 持续状态，可以在热重启以及完整的应用重启期间保持状态。

## Usage

### Use HydratedBlocDelegate

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(App());
}
```

### Extend HydratedBloc and override initialState, fromJson and toJson method

比如 类 A 继承了 HydratedBloc ，并复写了 fromJson 和 toJson，此时类 A 的state，可以通过 fromJson 和 toJson **自动**进行读写

#### fromJson 读取

Called when trying to read cached state from storage. Be sure to handle any exceptions that can occur and return null to indicate that there is no cached data.

Responsible(职责) for converting(转换) the `Map<String, dynamic>` representation of the bloc state into a concrete(准确的) instance of the bloc state.

If `fromJson` throws an `Exception`, `HydratedBloc` will return an `initialState` of `null`, so it is recommended to set `initialState` in the bloc to `super.initialState() ?? defaultInitialState()`

```dart
State fromJson(Map<String, dynamic> json);
```

#### toJson 写入

Called on each state change (transition), If it returns null, then no cache updates will occur. Otherwise, the returned value will be cached.

Responsible for converting a concrete instance of the bloc state into the the `Map<String, dynamic>` representation.

If `toJson` returns `null`, then no state changes will be persisted.

```dart
Map<String, dynamic> toJson(State state);
```

### Custom Storage Directory

> Note: By default, all data is written to `temporary storage` which means it can be wiped(擦掉) by the operating system at any point in time.

An optional `storageDirectory` can be provided to override the default temporary storage directory:

```dart
BlocSupervisor.delegate = await HydratedBlocDelegate.build(
  storageDirectory: await getApplicationDocumentsDirectory(),
);
```

### Custom Hydrated Storage

If the default `HydratedBlocStorage` doesn't meet your needs, you can always implement a custom HydratedStorage by simply implementing the HydratedStorage interface and initializing HydratedBlocDelegate with the custom HydratedStorage.

```dart
// my_hydrated_storage.dart

class MyHydratedStorage implements HydratedStorage {
  @override
  dynamic read(String key) {
    // TODO: implement read
  }

  @override
  Future<void> write(String key, dynamic value) async {
    // TODO: implement write
  }

  @override
  Future<void> delete(String key) async {
    // TODO: implement delete
  }

  @override
  Future<void> clear() async {
    // TODO: implement clear
  }
}
// my_hydrated_bloc_delegate.dart

class MyHydratedBlocDelegate extends HydratedBlocDelegate {
 MyHydratedBlocDelegate() : super(MyHydratedBlocStorage());
}
// main.dart

BlocSupervisor.delegate = MyHydratedBlocDelegate();
```

## Ref

[https://pub.dev/packages/hydrated_bloc](https://pub.dev/packages/hydrated_bloc)
