import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_bloc_event.dart';
part 'switch_bloc_state.dart';

class SwitchBlocBloc extends Bloc<SwitchBlocEvent, SwitchBlocState> {
  SwitchBlocBloc() : super(const SwitchBlocInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const SwitchBlocState(switchValue: true));
    });

    on<SwitchOffEvent>((event, emit) {
      emit(const SwitchBlocState(switchValue: false));
    });
  }
}
