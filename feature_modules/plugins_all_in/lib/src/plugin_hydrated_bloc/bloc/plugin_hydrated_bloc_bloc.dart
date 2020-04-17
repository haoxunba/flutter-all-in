import 'package:hydrated_bloc/hydrated_bloc.dart';

// 通过继承 HydratedBloc ，并实现了 fromJson 和 toJson，此时 PluginHydratedBlocBloc
// 可以自动保存 state，当状态变更时。
class PluginHydratedBlocBloc
    extends HydratedBloc<PluginHydratedBlocEvent, PluginHydratedBlocState> {
  // Use previously cached initialState if it's available
  @override
  PluginHydratedBlocState get initialState {
    return super.initialState ?? PluginHydratedBlocState(0);
  }

  // Called when trying to read cached state from storage.
  // Be sure to handle any exceptions that can occur and return null
  // to indicate that there is no cached data.
  // 读取
  @override
  PluginHydratedBlocState fromJson(Map<String, dynamic> source) {
    try {
      return PluginHydratedBlocState(source['value'] as int);
    } catch (_) {
      return null;
    }
  }

  // Called on each state change (transition)
  // If it returns null, then no cache updates will occur.
  // Otherwise, the returned value will be cached.
  // 写入
  @override
  Map<String, int> toJson(PluginHydratedBlocState state) {
    try {
      return {'value': state.value};
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<PluginHydratedBlocState> mapEventToState(
      PluginHydratedBlocEvent event) async* {
    switch (event) {
      case PluginHydratedBlocEvent.decrement:
        yield PluginHydratedBlocState(state.value - 1);
        break;
      case PluginHydratedBlocEvent.increment:
        yield PluginHydratedBlocState(state.value + 1);
        break;
    }
  }
}

enum PluginHydratedBlocEvent { increment, decrement }

class PluginHydratedBlocState {
  int value;

  PluginHydratedBlocState(this.value);
}
