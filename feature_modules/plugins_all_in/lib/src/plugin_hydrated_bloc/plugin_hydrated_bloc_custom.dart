import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'bloc/plugin_hydrated_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PluginHydratedBloc extends StatefulWidget {
  PluginHydratedBloc({Key key}) : super(key: key);

  @override
  _PluginHydratedBlocState createState() => _PluginHydratedBlocState();
}

class _PluginHydratedBlocState extends State<PluginHydratedBloc> {
  @override
  void initState() {
    super.initState();
  }

  // 官网案例是在 main() 里初始化 BlocDelegate ，现在我这么写有个bug，
  // 第一次进入该页面时，因为下面时异步函数，导致初始化 BlocDelegate 延迟，会
  // 报错 `type 'BlocDelegate' is not a subtype of type 'HydratedBlocDelegate' in type cast`
  // 通过下面 print 很好分析先后执行顺序
  // 第二次进入该页面时，因为初始化完成了，就不会报错了
  Future<void> _initializeBlocSupervisor() async {
    await HydratedBlocStorage.getInstance().then((storage) {
      BlocSupervisor.delegate = CustomBlocDelegate(storage: storage);
    });
    print('_initializeBlocSupervisor');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PluginHydratedBlocBloc>(
      create: (_) => PluginHydratedBlocBloc(),
      child: FutureBuilder(
        future: _initializeBlocSupervisor(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return BlocBuilder<PluginHydratedBlocBloc,
                  PluginHydratedBlocState>(
                builder: (context, state) {
                  return Scaffold(
                    appBar: AppBar(title: Text('Reading and Writing Files')),
                    body: Center(
                      child: Text(
                        '${state.value}',
                      ),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<PluginHydratedBlocBloc>(context)
                            .add(PluginHydratedBlocEvent.increment);
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}

class CustomBlocDelegate extends HydratedBlocDelegate {
  ///Creates a new [CustomBlocDelegate]
  CustomBlocDelegate({
    @required HydratedStorage storage,
  })  : assert(storage != null),
        super(storage);

  /// 继承自 [BlocDelegate]
  /// 只要给定的[bloc]和[transition]在任何[bloc]中发生转换，就会调用此方法。
  /// 当添加了一个新的事件并执行了mapEventToState时，就会发生[transition]。
  /// [onTransition]在更新[bloc]的状态之前被调用。
  /// 一个添加通用日志记录/分析的好地方。
  /// [下面的print没有执行，执行时机是什么？还是有bug?]
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(
        '${bloc.runtimeType} currentState: ${transition.currentState} event: ${transition.event} nextState: ${transition.nextState}');
  }

  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('error');
  }
}
