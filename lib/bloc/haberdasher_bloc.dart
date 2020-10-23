import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterhaberdasher/model/model.dart';
import 'package:flutterhaberdasher/model/rpc/haberdasher/service.twirp.dart';

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
      var hat = await client.makeHat(event.size);
      print(hat);
      yield HatLoaded(hat: hat);
    }
  }
}
