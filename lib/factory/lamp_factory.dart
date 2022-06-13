import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'lamp_factory.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class LampFactory {
  LampFactory();

  String name = "";
  bool start = false;
  bool autoBrightness = false;
  bool randomMode = false;
  int brightness = 50;
  String color = "00B0F0";

  factory LampFactory.fromJson(Map<String, dynamic> json) =>
      _$LampFactoryFromJson(json);
  Map<String, dynamic> toJson() => _$LampFactoryToJson(this);
}