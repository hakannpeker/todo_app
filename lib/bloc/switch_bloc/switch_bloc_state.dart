part of 'switch_bloc_bloc.dart';

class SwitchBlocState extends Equatable {
 final bool switchValue;
  const SwitchBlocState(
    {required this.switchValue,}
  );

  @override
  List<Object> get props => [switchValue];
}

class SwitchBlocInitial extends SwitchBlocState {
  const SwitchBlocInitial({required bool switchValue}) : super(switchValue: switchValue);
}
