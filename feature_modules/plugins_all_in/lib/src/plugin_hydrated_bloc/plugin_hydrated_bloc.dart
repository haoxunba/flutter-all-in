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
    BlocSupervisor.delegate = await HydratedBlocDelegate.build();
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
                    appBar: AppBar(title: Text('hydrated bloc')),
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
