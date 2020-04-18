import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_sdk/platform_sdk.dart';
import 'bloc/bloc.dart';

// 介绍 Bloc 基本使用流程
class BlocMultiBlocListner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files')),
      body: BlocProvider(
        create: (_) => BlocMultiBlocListnerBloc(),
        child: MultiBlocListnerPage(),
      ),
    );
  }
}

class MultiBlocListnerPage extends StatefulWidget {
  MultiBlocListnerPage({Key key}) : super(key: key);

  @override
  _BlocBasicState createState() => _BlocBasicState();
}

class _BlocBasicState extends State<MultiBlocListnerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlocMultiBlocListnerBloc, BlocMultiBlocListnerState>(
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
      child: BlocBuilder<BlocMultiBlocListnerBloc, BlocMultiBlocListnerState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${state.value}',
                ),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<BlocMultiBlocListnerBloc>(context)
                        .add(BlocMultiBlocListnerEvent.increment);
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
