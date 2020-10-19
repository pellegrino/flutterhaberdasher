import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutterhaberdasher/models/models.dart';

class MakeHatRequested extends HaberdasherEvent {
  final Size size;

  @override
  List<Object> get props => [this.size];

  const MakeHatRequested({@required this.size}) : assert(size != null);
}

abstract class HaberdasherEvent extends Equatable {
  const HaberdasherEvent();
}
