import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';
import 'package:lightcontrol/model/lamp.dart';

class LampService {
  LampFactory lampFactory = LampFactory();
  Lamp defaultLampAPI = Lamp();
  String nameTest = "";

  Future<Lamp> getLampState(context) async {
    try {
      var response = await Dio().get(
          'https://lightcontrol-moc.herokuapp.com/api/lights/62a8db955411b47ad7924701');
      print(response);
      this.lampFactory = LampFactory.fromJson(response.data);

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
}
