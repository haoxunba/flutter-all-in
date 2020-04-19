import 'package:bloc/bloc.dart';
import 'bloc.dart';

class BlocValueBloc extends Bloc<BlocValueEvent, BlocValueState> {
  @override
  BlocValueState get initialState => BlocValueState(0);

  @override
  Stream<BlocValueState> mapEventToState(BlocValueEvent event) async* {
    switch (event) {
      case BlocValueEvent.decrement:
        yield BlocValueState(state.value - 1);
        break;
      case BlocValueEvent.increment:
        yield BlocValueState(state.value + 1);
        break;
    }
  }
}
