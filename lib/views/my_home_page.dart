import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lightcontrol/components/brightness_cursor.dart';
import 'package:lightcontrol/components/color_palette.dart';
import 'package:lightcontrol/components/horizontal_card.dart';
import 'package:lightcontrol/components/switch_button.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';
import 'package:lightcontrol/model/lamp.dart';
import 'package:lightcontrol/services/lamp_service.dart';

import '../Message/DioExceptions.dart';

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
  // 50,0
  LampFactory lampFactoryTest = LampFactory();
  LampService lampService = LampService();
  var colorHex = {
    Colors.red: 'FF0000',
    Colors.orange: 'FFC000',
    Colors.yellow: 'FFFF00',
    Colors.white: 'FFFFFF',
    Colors.green: '00B050',
    Colors.lightBlue: '00B0F0',
    Colors.indigo.shade900: '002060',
    Colors.purple: '7030A0',
    Colors.pink.shade400: 'FD6C9E'
  };

  void selectColor(Color color) {
    // if (!widget.lamp.checkIfOn()) {
    //   print('allumer la lampe avant de selectionner une couleur');
    // } else {
    String colorSelected = colorHex[color]!;
    widget.defaultLamp.changeColor(colorSelected);
    lampService.updateColor(context, colorSelected);
    //}
    //lamp.infos();
  }

  void switchAutoBrightness(bool switchMode) {
    widget.defaultLamp.switchAutoBrightness(switchMode);
    lampService.updateAutoBrightness(context, switchMode);
  }

  void switchRandomMode(bool switchMode) {
    widget.defaultLamp.switchRandomMode(switchMode);
    lampService.updateRandomMode(context, switchMode);
  }

  void changeBrightnessWithSlider(int curserValue) {
    widget.defaultLamp.changeBrightness(curserValue);
    lampService.updateBrightness(context, curserValue);
  }

  String displayLampInfos() {
    return widget.defaultLamp.displayInfosLampOnScreen();
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

  void setSwitchAutoBrightnes(bool val) {
    setState(() {
      isSwitchedAutoBrightness = val;
      switchAutoBrightness(isSwitchedAutoBrightness);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitchRandomMode(bool val) {
    setState(() {
      isSwitchedRandomMode = val;
      switchRandomMode(isSwitchedRandomMode);
      widget.infoLamp = displayLampInfos();
    });
  }

  late bool isSwitchedAutoBrightness = widget.defaultLamp.autoBrightness;
  late bool isSwitchedRandomMode = widget.defaultLamp.randomMode;
  late double valueCursor = 35; //widget.defaultLamp.brightness.toDouble();

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
                      String instruction = "start";
                      setState(() {
                        print("truc");
                        print(valueCursor);

                        //instructionToAPI(instruction);
                      });

                      // print(widget.defaultLamp
                      //     .displayInfosLampOnScreen(widget.defaultLamp));
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
            valueCursor: valueCursor,
            setBrightness: setBrightness,
          ),

          //  "  🎵" les switch button

          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SwitchButton(
                    activeText: "  💡",
                    isSwitched: widget.defaultLamp.autoBrightness,
                    setSwitch: setSwitchAutoBrightnes,
                    topText: 'Auto Brightness', //
                  ),
                  SwitchButton(
                    activeText: "  🔀",
                    isSwitched: widget.defaultLamp.randomMode,
                    setSwitch: setSwitchRandomMode,
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
