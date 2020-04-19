import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc_value_page.dart';

// 介绍 BlocProvider.value 基本使用流程
class BlocValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: BlocProvider<BlocValueBloc>(
        create: (_) => BlocValueBloc(),
        child: _BlocValueChild(),
      ),
    );
  }
}

class _BlocValueChild extends StatefulWidget {
  _BlocValueChild({Key key}) : super(key: key);

  @override
  _BlocBasicState createState() => _BlocBasicState();
}

class _BlocBasicState extends State<_BlocValueChild> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocValueBloc, BlocValueState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: <Widget>[
              Text(
                '导航到下一个页面',
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocValuePage(
                              blocValueBloc:
                                  BlocProvider.of<BlocValueBloc>(context),
                            )),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
