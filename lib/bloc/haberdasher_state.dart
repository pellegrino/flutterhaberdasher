part of 'haberdasher_bloc.dart';

@immutable
abstract class HaberdasherState extends Equatable {
  const HaberdasherState();

  @override
  List<Object> get props => [];
}

class HatLoaded extends HaberdasherState {
  final Hat hat;
  HatLoaded({@required this.hat});

  @override
  List<Object> get props => [hat];
}

class HatError extends HaberdasherState {
  final String message;

  HatError({@required this.message});

  @override
  List<Object> get props => [message];
}

class HatInitial extends HaberdasherState {}
