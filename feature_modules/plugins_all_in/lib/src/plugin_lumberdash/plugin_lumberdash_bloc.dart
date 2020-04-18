import 'package:bloc/bloc.dart';
import 'package:lumberdash/lumberdash.dart';

class PluginLumberdashBloc
    extends Bloc<PluginLumberdashBlocEvent, PluginLumberdashBlocState> {
  @override
  PluginLumberdashBlocState get initialState => PluginLumberdashBlocState(0);

  @override
  Stream<PluginLumberdashBlocState> mapEventToState(
      PluginLumberdashBlocEvent event) async* {
    switch (event) {
      case PluginLumberdashBlocEvent.decrement:
        yield PluginLumberdashBlocState(state.value - 1);
        break;
      case PluginLumberdashBlocEvent.increment:
        logWarning('Hello Warning');
        yield PluginLumberdashBlocState(state.value + 1);
        break;
    }
  }
}

enum PluginLumberdashBlocEvent { increment, decrement }

class PluginLumberdashBlocState {
  int value;

  PluginLumberdashBlocState(this.value);
}
