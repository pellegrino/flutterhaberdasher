import 'package:flutter/material.dart';
import 'package:flutterhaberdasher/models/models.dart';

class HaberdasherRepository {
  final ProtobufHaberdasher haberdasherClient;

  HaberdasherRepository({@required this.haberdasherClient})
      : assert(haberdasherClient != null);

  Future<Hat> makeHat(Size size) async {
    return this.haberdasherClient.makeHat(size);
  }
}
