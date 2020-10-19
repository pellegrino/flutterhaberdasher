///
//  Generated code. Do not modify.
//  source: rpc/haberdasher/service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'service.pb.dart' as $0;
import 'service.pbjson.dart';

export 'service.pb.dart';

abstract class HaberdasherServiceBase extends $pb.GeneratedService {
  $async.Future<$0.Hat> makeHat($pb.ServerContext ctx, $0.Size request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'MakeHat':
        return $0.Size();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'MakeHat':
        return this.makeHat(ctx, request);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      HaberdasherServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => HaberdasherServiceBase$messageJson;
}
