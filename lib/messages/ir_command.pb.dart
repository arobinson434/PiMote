//
//  Generated code. Do not modify.
//  source: ir_command.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class IrCommand extends $pb.GeneratedMessage {
  factory IrCommand({
    $core.String? name,
    $core.Iterable<$core.int>? interval,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (interval != null) {
      $result.interval.addAll(interval);
    }
    return $result;
  }
  IrCommand._() : super();
  factory IrCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IrCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IrCommand', package: const $pb.PackageName(_omitMessageNames ? '' : 'IrRelay'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..p<$core.int>(2, _omitFieldNames ? '' : 'interval', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IrCommand clone() => IrCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IrCommand copyWith(void Function(IrCommand) updates) => super.copyWith((message) => updates(message as IrCommand)) as IrCommand;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IrCommand create() => IrCommand._();
  IrCommand createEmptyInstance() => create();
  static $pb.PbList<IrCommand> createRepeated() => $pb.PbList<IrCommand>();
  @$core.pragma('dart2js:noInline')
  static IrCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IrCommand>(create);
  static IrCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get interval => $_getList(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
