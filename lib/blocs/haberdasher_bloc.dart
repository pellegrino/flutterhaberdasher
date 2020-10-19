import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:flutterhaberdasher/blocs/blocs.dart';
import 'package:flutterhaberdasher/repositories/repositories.dart';
import 'package:flutterhaberdasher/models/models.dart';

class HaberdasherBloc extends Bloc<HaberdasherEvent, HaberdasherState> {
  final HaberdasherRepository haberdasherRepository;

  HaberdasherBloc({@required this.haberdasherRepository})
      : assert(haberdasherRepository != null),
        super(MakeHatInitial());

  @override
  Stream<HaberdasherState> mapEventToState(HaberdasherEvent event) async* {
    if (event is MakeHatRequested) {
      yield MakeHatLoadInProgress();
      try {
        final Hat hat = await this.haberdasherRepository.makeHat(event.size);
        yield MakeHatLoadSuccess(hat: hat);
      } catch (_) {
        yield MakeHatLoadFailure();
      }
    }
  }
}
