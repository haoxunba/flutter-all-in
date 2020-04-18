import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class BlocBasic extends StatefulWidget {
  BlocBasic({Key key}) : super(key: key);

  @override
  _BlocBasicState createState() => _BlocBasicState();
}

class _BlocBasicState extends State<BlocBasic> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBasicBloc, BlocBasicState>(
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
              BlocProvider.of<BlocBasicBloc>(context)
                  .add(BlocBasicEvent.increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
