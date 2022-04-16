import 'package:flutter/material.dart';
import 'package:lightcontrol/components/brightness_cursor.dart';
import 'package:lightcontrol/components/color_palette.dart';
import 'package:lightcontrol/components/switch_button.dart';
import 'package:lightcontrol/lamp.dart';

class MyHomePage extends StatefulWidget {
  String infoLamp;
  Lamp lamp;
  MyHomePage({Key? key, required this.infoLamp, required this.lamp}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  double valueCursor = 50.0; // 50,0
  var colorHex = {Colors.red: 'FF0000', Colors.orange: 'FFC000', Colors.yellow: 'FFFF00', Colors.white: 'FFFFFF', Colors.green: '00B050', Colors.lightBlue: '00B0F0', Colors.indigo.shade900: '002060', Colors.purple: '7030A0', Colors.pink.shade400: 'FD6C9E'};

  void selectColor(Color color) {
    if (!widget.lamp.checkIfOnOff()) {
      print('allumer la lampe avant de selectionner une couleur');
    } else {
      String colorSelected = colorHex[color]!;
      widget.lamp.changeColor(colorSelected);
    }
    //lamp.infos();
  }

  void switchBrightnessMode(bool switchMode) {
    widget.lamp.switchAuto(switchMode);
  }

  void switchMusicMode(bool switchMode) {
    widget.lamp.switchMusic(switchMode);
  }

  void changeBrightnessWithSlider(int curserValue) {
    widget.lamp.changeBrightness(curserValue);
  }

  String displayLampInfos() {
    return widget.lamp.displayInfosLamp();
  }

  void setColor(Color color) {
    setState(() {
      selectColor(Colors.red);
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
      switchBrightnessMode(isSwitched);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitch2(bool val) {
    setState(() {
      isSwitched2 = val;
      switchMusicMode(isSwitched2);
      widget.infoLamp = displayLampInfos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //backgroundColor: Colors.white,
      child: Column(
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 0.8,
            child: Container(
              color: Colors.white,
              height: 270,
              margin: const EdgeInsets.only(top: 50.0),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.infoLamp,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  // fontFamily: fontFamily,
                  height: 1.5,
                ),
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
                  ColorPalette(setColor: () => setColor(Colors.red), color: Colors.red),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.orange), color: Colors.orange),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.yellow), color: Colors.yellow),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.white), color: Colors.white),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.green), color: Colors.green),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.lightBlue), color: Colors.lightBlue),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.indigo.shade900), color: Colors.indigo.shade900),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.purple), color: Colors.purple),
                  Spacer(flex: 1),
                  ColorPalette(setColor: () => setColor(Colors.pink.shade400), color: Colors.pink.shade400),
                  Spacer(flex: 1),
                ],
              ),
            ),
            flex: 1,
          ),
          BrightnessCursor(valueCursor: valueCursor, setBrightness: setBrightness),
          //  "  🎵" les switch button

          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[SwitchButton(activeText: "  💡", isSwitched: isSwitched, setSwitch: setSwitch), SwitchButton(activeText: "  🎵", isSwitched: isSwitched2, setSwitch: setSwitch2)],
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
