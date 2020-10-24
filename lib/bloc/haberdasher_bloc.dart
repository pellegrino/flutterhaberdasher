import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterhaberdasher/model/model.dart';
import 'package:flutterhaberdasher/model/rpc/haberdasher/service.twirp.dart';
import 'package:twirp_dart_core/twirp_dart_core.dart';

part 'haberdasher_event.dart';
part 'haberdasher_state.dart';

class HaberdasherBloc extends Bloc<HaberdasherEvent, HaberdasherState> {
  final Haberdasher client;
  HaberdasherBloc({
    @required Haberdasher this.client,
  })  : assert(client != null),
        super(HatInitial());

  @override
  HaberdasherState get initialState => HatInitial();

  @override
  Stream<HaberdasherState> mapEventToState(
    HaberdasherEvent event,
  ) async* {
    if (event is MakeHatStarted) {
      try {
        var hat = await client.makeHat(event.size);
        yield HatLoaded(hat: hat);
      } on TwirpException catch (e) {
        yield HatError(message: e.message);
      }
    }
  }
}
