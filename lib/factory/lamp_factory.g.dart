// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamp_factory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LampFactory _$LampFactoryFromJson(Map<String, dynamic> json) => LampFactory()
  ..id = json['id'] as String
  ..powerOn = json['powerOn'] as bool
  ..autoBrightness = json['autoBrightness'] as bool
  ..randomMode = json['randomMode'] as bool
  ..partyMode = json['partyMode'] as bool
  ..brightness = json['brightness'] as int
  ..color = json['color'] as String;

Map<String, dynamic> _$LampFactoryToJson(LampFactory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'powerOn': instance.powerOn,
      'autoBrightness': instance.autoBrightness,
      'randomMode': instance.randomMode,
      'partyMode': instance.partyMode,
      'brightness': instance.brightness,
      'color': instance.color,
    };
