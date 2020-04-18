import 'package:bloc/bloc.dart';
import 'bloc.dart';

class BlocBasicBloc extends Bloc<BlocBasicEvent, BlocBasicState> {
  @override
  BlocBasicState get initialState => BlocBasicState(0);

  @override
  Stream<BlocBasicState> mapEventToState(BlocBasicEvent event) async* {
    switch (event) {
      case BlocBasicEvent.decrement:
        yield BlocBasicState(state.value - 1);
        break;
      case BlocBasicEvent.increment:
        yield BlocBasicState(state.value + 1);
        break;
    }
  }
}
