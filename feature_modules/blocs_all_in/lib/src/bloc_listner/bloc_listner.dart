import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_sdk/platform_sdk.dart';
import 'bloc/bloc.dart';

// 介绍 Bloc 基本使用流程
class BlocBlocListner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BlocListner')),
      body: BlocProvider(
        create: (_) => BlocListnerBloc(),
        child: BlocListnerPage(),
      ),
    );
  }
}

class BlocListnerPage extends StatefulWidget {
  BlocListnerPage({Key key}) : super(key: key);

  @override
  _BlocListnerState createState() => _BlocListnerState();
}

class _BlocListnerState extends State<BlocListnerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocListnerBloc, BlocListnerState>(
      condition: (previous, current) {
        // 根据源码 BlocListenerBase 了解到，只有返回值为 ture ， 才会更新 previous.value ，
        // 否则 previous.value 就一直是初始化的值。
        return previous.value == 0;
      },
      listener: (contest, state) {
        if (state.value > 10) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: RandomColor().randomColor(),
              content: Text('state.vale greater than 10'),
            ),
          );
        }
      },
      child: BlocBuilder<BlocListnerBloc, BlocListnerState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${state.value}',
                ),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<BlocListnerBloc>(context)
                        .add(BlocListnerEvent.increment);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
