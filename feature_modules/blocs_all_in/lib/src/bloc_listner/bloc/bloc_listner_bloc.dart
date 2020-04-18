import 'package:bloc/bloc.dart';
import 'bloc.dart';

class BlocListnerBloc extends Bloc<BlocListnerEvent, BlocListnerState> {
  @override
  BlocListnerState get initialState => BlocListnerState(0);

  @override
  Stream<BlocListnerState> mapEventToState(BlocListnerEvent event) async* {
    switch (event) {
      case BlocListnerEvent.decrement:
        yield BlocListnerState(state.value - 1);
        break;
      case BlocListnerEvent.increment:
        yield BlocListnerState(state.value + 1);
        break;
    }
  }
}
