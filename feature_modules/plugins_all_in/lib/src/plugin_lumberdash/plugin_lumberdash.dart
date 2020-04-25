import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:print_lumberdash/print_lumberdash.dart';
import 'package:file_lumberdash/file_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumberdash/lumberdash.dart';
import 'plugin_lumberdash_bloc.dart';

class PluginLumberdash extends StatefulWidget {
  PluginLumberdash({Key key}) : super(key: key);

  @override
  _PluginLumberdash createState() => _PluginLumberdash();
}

class _PluginLumberdash extends State<PluginLumberdash> {
  @override
  void initState() {
    super.initState();
    putLumberdashToWork(withClients: [PrintLumberdash()]);

    /// [有bug，能打印log，但是颜色不能显示]
    logWarning('Hello Warning');
    logFatal('Hello Fatal!');
    logMessage('Hello Message!');
    logError(Exception('Hello Error'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PluginLumberdashBloc>(
      create: (_) => PluginLumberdashBloc(),
      child: BlocBuilder<PluginLumberdashBloc, PluginLumberdashBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Reading and Writing Files')),
            body: Center(
              child: Text(
                '',
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<PluginLumberdashBloc>(context)
                    .add(PluginLumberdashBlocEvent.increment);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
