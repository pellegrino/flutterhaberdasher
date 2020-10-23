part of 'haberdasher_bloc.dart';

@immutable
abstract class HaberdasherEvent extends Equatable {
  const HaberdasherEvent();
}

class MakeHatStarted extends HaberdasherEvent {
  final Size size;

  MakeHatStarted({@required this.size}) : assert(size != null);

  @override
  List<Object> get props => [size];
}
