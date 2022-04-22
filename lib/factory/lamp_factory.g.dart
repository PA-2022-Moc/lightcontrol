// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamp_factory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LampFactory _$LampFactoryFromJson(Map<String, dynamic> json) => LampFactory()
  ..name = json['name'] as String
  ..start = json['start'] as bool
  ..autoBrightness = json['autoBrightness'] as bool
  ..randomMode = json['randomMode'] as bool
  ..brightness = json['brightness'] as int
  ..color = json['color'] as String;

Map<String, dynamic> _$LampFactoryToJson(LampFactory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start': instance.start,
      'autoBrightness': instance.autoBrightness,
      'randomMode': instance.randomMode,
      'brightness': instance.brightness,
      'color': instance.color,
    };
