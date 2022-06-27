import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';
import 'package:lightcontrol/model/lamp.dart';

class LampService {
  LampFactory lampFactory = LampFactory();
  Lamp defaultLampAPI = Lamp();
  String idLamp = "";

  Future<Lamp> getLampState(context) async {
    try {
      var response = await Dio().get(
          'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701');
      print(response);
      this.lampFactory = LampFactory.fromJson(response.data);

      idLamp = lampFactory.id;
      defaultLampAPI.autoBrightness = lampFactory.autoBrightness;
      defaultLampAPI.randomMode = lampFactory.randomMode;
      defaultLampAPI.brightness = lampFactory.brightness;
      defaultLampAPI.color = lampFactory.color;
      defaultLampAPI.start = lampFactory.powerOn;

      return defaultLampAPI;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur reseau')));

      return defaultLampAPI;
    }
  }

  void patchLamp(context) async {
    try {
      var response =
          await Dio().patch('http://127.0.0.1:8010/api/v1/lamp/lamp=1');
      print(response);
      this.lampFactory = LampFactory.fromJson(response.data);
      print(lampFactory);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur reseau')));
    }
  }

  Future<void> updateStart(context, bool start) async {
    try {
      Response response = await Dio().put(
        'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701/powerOn',
        data: {
          "powerOn": start,
        },
      );

      print('lamp updated: ${response.data}');
    } catch (e) {
      print('Error updating lamp: $e');
    }
  }

  Future<void> updateBrightness(context, int valueBrightness) async {
    try {
      Response response = await Dio().put(
        'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701/brightness',
        data: {
          "brightness": valueBrightness,
        },
      );

      print('lamp updated: ${response.data}');
    } catch (e) {
      print('Error updating lamp: $e');
    }
  }

  Future<void> updateAutoBrightness(context, bool isAutoBrightness) async {
    try {
      Response response = await Dio().put(
        'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701/autoBrightness',
        data: {
          "autoBrightness": isAutoBrightness,
        },
      );

      print('lamp updated: ${response.data}');
    } catch (e) {
      print('Error updating lamp: $e');
    }
  }

  Future<void> updatePartyMode(context, bool isRandomMode) async {
    try {
      Response response = await Dio().put(
        'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701/randomMode',
        data: {
          "randomMode": isRandomMode,
        },
      );

      print('lamp updated: ${response.data}');
    } catch (e) {
      print('Error updating lamp: $e');
    }
  }

  Future<void> updateColor(context, String color) async {
    try {
      Response response = await Dio().put(
        'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701/color',
        data: {
          "color": color,
        },
      );

      print('lamp updated: ${response.data}');
    } catch (e) {
      print('Error updating lamp: $e');
    }
  }

//   Future<void> makePutRequest() async {
//   final url = Uri.parse('$urlPrefix/posts/1');
//   final headers = {"Content-type": "application/json"};
//   final json = '{"title": "Hello", "body": "body text", "userId": 1}';
//   final response = await put(url, headers: headers, body: json);
//   print('Status code: ${response.statusCode}');
//   print('Body: ${response.body}');
// }
}
