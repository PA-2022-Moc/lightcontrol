import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lightcontrol/components/brightness_cursor.dart';
import 'package:lightcontrol/components/color_palette.dart';
import 'package:lightcontrol/components/horizontal_card.dart';
import 'package:lightcontrol/components/switch_button.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';
import 'package:lightcontrol/model/lamp.dart';
import 'package:lightcontrol/services/lamp_service.dart';

class MyHomePage extends StatefulWidget {
  String infoLamp;
  Lamp defaultLamp;
  Lamp newLamp;
  MyHomePage({
    Key? key,
    required this.infoLamp,
    required this.defaultLamp,
    required this.newLamp,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int reponse = -1;
  bool isSwitched = false;
  bool isSwitched2 = false;
  double valueCursor = 50.0; // 50,0
  LampFactory lampFactoryTest = LampFactory();
  LampService lampService = LampService();
  String nameTest = "";
  var colorHex = {
    Colors.red: 'FF0000',
    Colors.orange: 'FFC000',
    Colors.yellow: 'FFFF00',
    Colors.white: 'FFFFFF',
    Colors.green: '00B050',
    Colors.blue: '00B0F0',
    Colors.indigo.shade900: '002060',
    Colors.purple: '7030A0',
    Colors.pink.shade400: 'FD6C9E'
  };

  void getHttp() async {
    try {
      var response =
          await Dio().get('http://127.0.0.1:8010/api/v1/lamp/lamp=1');
      print(response);
      this.lampFactoryTest = LampFactory.fromJson(response.data);
      print(lampFactoryTest);
      nameTest = lampFactoryTest.name;
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erreur reseau')));
    }
  }

  void getLamp() {
    lampService.getLampState(context);
    //widget.newLamp.changeBrightness(lampService.getLampState(context).lampFactoryTest.brightness.toString());
  }

  void selectColor(Color color) {
    // if (!widget.lamp.checkIfOn()) {
    //   print('allumer la lampe avant de selectionner une couleur');
    // } else {
    String colorSelected = colorHex[color]!;
    widget.defaultLamp.changeColor(colorSelected);
    //}
    //lamp.infos();
  }

  void switchAutoBrightness(bool switchMode) {
    widget.defaultLamp.switchAutoBrightness(switchMode);
  }

  void switchRandomMode(bool switchMode) {
    widget.defaultLamp.switchRandomMode(switchMode);
  }

  void changeBrightnessWithSlider(int curserValue) {
    widget.defaultLamp.changeBrightness(curserValue);
  }

  String displayLampInfos() {
    return widget.defaultLamp.displayInfosLamp();
  }

  void setColor(Color color) {
    setState(() {
      selectColor(color);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setBrightness(dynamic value) {
    setState(() {
      valueCursor = value;
      int valueInt = valueCursor.toInt();
      changeBrightnessWithSlider(valueInt);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitch(bool val) {
    setState(() {
      isSwitched = val;
      switchAutoBrightness(isSwitched);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitch2(bool val) {
    setState(() {
      isSwitched2 = val;
      switchRandomMode(isSwitched2);
      widget.infoLamp = displayLampInfos();
    });
  }

  @override
  Widget build(BuildContext context) {
    //final myAppState = _MyAppState();
    return Container(
      //backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 2.0,
            child: Container(
                height: 250,
                // margin: const EdgeInsets.only(top: 0.8),
                // padding: const EdgeInsets.all(0.8),
                child: HorizontalCaroussel(
                    content: widget.infoLamp)), // getHttp widget.infoLamp
          ),
          Container(
            color: Colors.red,
            height: 100.0,
            width: 414,
            child: Center(
              child: Column(
                // add Column
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Welcome',
                      style: TextStyle(
                          // your text
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  RaisedButton(
                    onPressed: () {
                      print("truc");
                      //getHttp();
                      getLamp();
                      print("bla  " + nameTest);
                    },
                    child: Text('TEST'),
                  ), // your button beneath text
                ],
              ),
            ),
          ),
          Expanded(
            // les color buttons
            child: Container(
              color: Colors.white,
              height: 10.0,
              width: 414,
              padding: const EdgeInsets.all(20),
              child: Row(
                // faire les boutons a ce niveau
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.red), color: Colors.red),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.orange),
                      color: Colors.orange),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.yellow),
                      color: Colors.yellow),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.white),
                      color: Colors.white),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.green),
                      color: Colors.green),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.lightBlue),
                      color: Colors.blue),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.indigo.shade900),
                      color: Colors.indigo.shade900),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.purple),
                      color: Colors.purple),
                  Spacer(flex: 1),
                  ColorPalette(
                      setColor: () => setColor(Colors.pink.shade400),
                      color: Colors.pink.shade400),
                  Spacer(flex: 1),
                ],
              ),
            ),
            flex: 1,
          ),
          BrightnessCursor(
              valueCursor: valueCursor, setBrightness: setBrightness),
          //  "  🎵" les switch button

          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SwitchButton(
                    activeText: "  💡",
                    isSwitched: isSwitched,
                    setSwitch: setSwitch,
                    topText: 'Auto Brightness', //
                  ),
                  SwitchButton(
                    activeText: "  🔀",
                    isSwitched: isSwitched2,
                    setSwitch: setSwitch2,
                    topText: "Random Mode",
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(children: [
                Container(
                  height: 200.0,
                  width: 207.0,
                  color: Colors.white,
                ),
                Container(
                  height: 200.0,
                  width: 207.0,
                  color: Colors.white,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
