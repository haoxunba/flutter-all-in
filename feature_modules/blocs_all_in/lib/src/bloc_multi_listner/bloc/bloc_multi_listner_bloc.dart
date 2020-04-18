import 'package:bloc/bloc.dart';
import 'bloc.dart';

class BlocMultiBlocListnerBloc
    extends Bloc<BlocMultiBlocListnerEvent, BlocMultiBlocListnerState> {
  @override
  BlocMultiBlocListnerState get initialState => BlocMultiBlocListnerState(0);

  @override
  Stream<BlocMultiBlocListnerState> mapEventToState(
      BlocMultiBlocListnerEvent event) async* {
    switch (event) {
      case BlocMultiBlocListnerEvent.decrement:
        yield BlocMultiBlocListnerState(state.value - 1);
        break;
      case BlocMultiBlocListnerEvent.increment:
        yield BlocMultiBlocListnerState(state.value + 1);
        break;
    }
  }
}
