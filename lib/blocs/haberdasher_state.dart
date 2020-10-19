import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutterhaberdasher/models/models.dart';

abstract class HaberdasherState extends Equatable {
  const HaberdasherState();

  @override
  List<Object> get props => [];
}

class MakeHatInitial extends HaberdasherState {}

class MakeHatLoadInProgress extends HaberdasherState {}

class MakeHatLoadSuccess extends HaberdasherState {
  final Hat hat;

  const MakeHatLoadSuccess({@required this.hat}) : assert(hat != null);

  @override
  List<Object> get props => [hat];
}

class MakeHatLoadFailure extends HaberdasherState {}
