import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';

class LampService {

  LampFactory lampFactoryTest = LampFactory();
  String nameTest = "";

  void getLampState(context) async {
    try {
      var response =
          await Dio().get('http://127.0.0.1:8010/api/v1/lamp/lamp=1');
      print(response);
      this.lampFactoryTest = LampFactory.fromJson(response.data);
      print(lampFactoryTest);
      nameTest = lampFactoryTest.name;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur reseau')));
    }
  }


  void patchLamp(context) async {
    try {
      var response =
          await Dio().patch('http://127.0.0.1:8010/api/v1/lamp/lamp=1');
      print(response);
      this.lampFactoryTest = LampFactory.fromJson(response.data);
      print(lampFactoryTest);
      nameTest = lampFactoryTest.name;
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur reseau')));
    }
  }


}
