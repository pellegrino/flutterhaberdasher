///
//  Generated code. Do not modify.
//  source: rpc/haberdasher/service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Size extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Size',
      package: const $pb.PackageName('kitanda.api.haberdasher'),
      createEmptyInstance: create)
    ..a<$core.int>(1, 'inches', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  Size._() : super();
  factory Size() => create();
  factory Size.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Size.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Size clone() => Size()..mergeFromMessage(this);
  Size copyWith(void Function(Size) updates) =>
      super.copyWith((message) => updates(message as Size));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Size create() => Size._();
  Size createEmptyInstance() => create();
  static $pb.PbList<Size> createRepeated() => $pb.PbList<Size>();
  @$core.pragma('dart2js:noInline')
  static Size getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Size>(create);
  static Size _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inches => $_getIZ(0);
  @$pb.TagNumber(1)
  set inches($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInches() => $_has(0);
  @$pb.TagNumber(1)
  void clearInches() => clearField(1);
}

class Hat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Hat',
      package: const $pb.PackageName('kitanda.api.haberdasher'),
      createEmptyInstance: create)
    ..a<$core.int>(1, 'inches', $pb.PbFieldType.O3)
    ..aOS(2, 'color')
    ..aOS(3, 'name')
    ..hasRequiredFields = false;

  Hat._() : super();
  factory Hat() => create();
  factory Hat.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Hat.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  Hat clone() => Hat()..mergeFromMessage(this);
  Hat copyWith(void Function(Hat) updates) =>
      super.copyWith((message) => updates(message as Hat));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Hat create() => Hat._();
  Hat createEmptyInstance() => create();
  static $pb.PbList<Hat> createRepeated() => $pb.PbList<Hat>();
  @$core.pragma('dart2js:noInline')
  static Hat getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Hat>(create);
  static Hat _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get inches => $_getIZ(0);
  @$pb.TagNumber(1)
  set inches($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasInches() => $_has(0);
  @$pb.TagNumber(1)
  void clearInches() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get color => $_getSZ(1);
  @$pb.TagNumber(2)
  set color($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class HaberdasherApi {
  $pb.RpcClient _client;
  HaberdasherApi(this._client);

  $async.Future<Hat> makeHat($pb.ClientContext ctx, Size request) {
    var emptyResponse = Hat();
    return _client.invoke<Hat>(
        ctx, 'Haberdasher', 'MakeHat', request, emptyResponse);
  }
}
