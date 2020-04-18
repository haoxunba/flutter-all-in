import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

// 介绍 Bloc 基本使用流程
class BlocBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: BlocProvider(
        create: (_) => BlocBasicBloc(),
        child: BlocBasicPage(),
      ),
    );
  }
}

class BlocBasicPage extends StatefulWidget {
  BlocBasicPage({Key key}) : super(key: key);

  @override
  _BlocBasicState createState() => _BlocBasicState();
}

class _BlocBasicState extends State<BlocBasicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBasicBloc, BlocBasicState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: <Widget>[
              Text(
                '${state.value}',
              ),
              RaisedButton(
                onPressed: () {
                  BlocProvider.of<BlocBasicBloc>(context)
                      .add(BlocBasicEvent.increment);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
