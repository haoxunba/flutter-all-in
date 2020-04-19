import 'package:platform_sdk/platform_sdk.dart';
import 'bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocValuePage extends StatelessWidget {
  final BlocValueBloc blocValueBloc;

  BlocValuePage({Key key, @required BlocValueBloc blocValueBloc})
      : blocValueBloc = blocValueBloc,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocValueBloc>.value(
      value: blocValueBloc,
      child: BlocValuePageItem(),
    );
  }
}

class BlocValuePageItem extends StatefulWidget {
  @override
  _BlocValueState createState() => _BlocValueState();
}

class _BlocValueState extends State<BlocValuePageItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocValueBloc, BlocValueState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Bloc Value Child Page'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text(
                  '${state.value}',
                ),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<BlocValueBloc>(context)
                        .add(BlocValueEvent.increment);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
