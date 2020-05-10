# Bloc Test

相关测试代码参考 `blocs_all_in/src/flutter_login/test/uint`.

## 两种测试方式

```dart
blocTest(
    'emits [LoginLoading, LoginInitial] and token on success',
    build: () async {
        when(userRepository.authenticate(
            username: 'valid.username',
            password: 'valid.password',
        )).thenAnswer((_) => Future.value('token'));
        return loginBloc;
    },
    act: (bloc) => bloc.add(
        LoginButtonPressed(
            username: 'valid.username',
            password: 'valid.password',
        ),
    ),
    expect: [
        LoginLoading(),
        LoginInitial(),
    ],
    verify: (_) async {
        verify(authenticationBloc.add(LoggedIn(token: 'token'))).called(1);
    },
);
```

```dart
test('emits token on success', () {
    final expectedResponse = [
        LoginInitial(),
        LoginLoading(),
        LoginInitial(),
    ];

    when(userRepository.authenticate(
        username: 'valid.username',
        password: 'valid.password',
    )).thenAnswer((_) => Future.value('token'));

    expectLater(
        loginBloc,
        emitsInOrder(expectedResponse),
    ).then((_) {
        verify(authenticationBloc.add(LoggedIn(token: 'token'))).called(1);
    });

    loginBloc.add(LoginButtonPressed(
        username: 'valid.username',
        password: 'valid.password',
    ));
});
```

两者的测试效果相同，上面的方式是新版本的书写规范。

## 注意事项

We have to extend `Equatable` in order to allow us to check if two instances of State are equal.

下面是实例

```dart
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
```

```dart
// 测试代码
test('initial state is correct', () {
    expect(LoginInitial(), loginBloc.initialState);
});
```

如果 LoginInitial 没有 extend Equatable，那么在执行测试代码时，会报错，提示 Expect 的实例和 Actual 的实例两者不相等。

## Ref

[Unit Testing with “Bloc”](https://medium.com/flutter-community/unit-testing-with-bloc-b94de9655d86)
