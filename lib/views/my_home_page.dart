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
  double cursorValue;
  Function changeColorAppBarWithColorSelection;
  MyHomePage({
    Key? key,
    required this.infoLamp,
    required this.defaultLamp,
    required this.newLamp,
    required this.cursorValue,
    required this.changeColorAppBarWithColorSelection,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LampFactory lampFactoryTest = LampFactory();
  LampService lampService = LampService();
  Lamp getLamp = Lamp();
  Lamp lamp = Lamp();

  void getTheLampAPI() async {
    getLamp = await lampService.getLampState(context);

    print("la lampe récupéré :");
    print(getLamp.color);
  }

  Future<double> getTheLampRamdomModAPI() async {
    getLamp = await lampService.getLampState(context);

    print("bightness récupéré :");
    print(getLamp.brightness);
    return getLamp.brightness.toDouble();
  }

  void selectColor(Color color) {
    String colorSelected = lamp.colorHex[color]!;
    widget.defaultLamp.changeColor(colorSelected);
    lampService.updateColor(context, colorSelected);
    widget.changeColorAppBarWithColorSelection(widget.defaultLamp, color);
  }

  void switchAutoBrightness(bool switchMode) {
    widget.defaultLamp.switchAutoBrightness(switchMode);
    lampService.updateAutoBrightness(context, switchMode);
  }

  void switchRandomMode(bool switchMode) {
    widget.defaultLamp.switchRandomMode(switchMode);
    lampService.updateRandomMode(context, switchMode);
  }

  void switchPartyMod(bool switchMode) {
    widget.defaultLamp.switchPartyMode(switchMode);
    lampService.updatePartyMode(context, switchMode);
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
    });
  }

  void setBrightness(dynamic value) {
    setState(() {
      widget.cursorValue = value;
      int valueInt = widget.cursorValue.toInt();
      changeBrightnessWithSlider(valueInt);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitchAutoBrightness(bool val) {
    setState(() {
      isSwitchedAutoBrightness = val;
      switchAutoBrightness(isSwitchedAutoBrightness);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitchRandomMode(bool val) {
    setState(() {
      if (widget.defaultLamp.partyMode == true) {
        setSwitchPartyMod(false);
      }
      isSwitchedRandomMode = val;
      switchRandomMode(isSwitchedRandomMode);
      widget.infoLamp = displayLampInfos();
    });
  }

  void setSwitchPartyMod(bool val) {
    setState(() {
      if (widget.defaultLamp.randomMode == true) {
        setSwitchRandomMode(false);
      }
      isSwitchedPartyMode = val;
      switchPartyMod(isSwitchedPartyMode);
      widget.infoLamp = displayLampInfos();
    });
  }

  bool isAbsorbingWithStart() {
    bool isAsorbing;
    if (widget.defaultLamp.start == true) {
      isAsorbing = false;
      return isAsorbing;
    } else {
      isAsorbing = true;
      return isAsorbing;
    }
  }

  late bool isSwitchedAutoBrightness = widget.defaultLamp.autoBrightness;
  late bool isSwitchedRandomMode = widget.defaultLamp.randomMode;
  late bool isSwitchedPartyMode = widget.defaultLamp.partyMode;

  @override
  Widget build(BuildContext context) {
    //final myAppState = _MyAppState();
    return AbsorbPointer(
      absorbing: isAbsorbingWithStart(), // les color buttons
      child: Container(
        //backgroundColor: Colors.white,

        child: Column(
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 2.0,
              child: Container(
                  height: 250,
                  child: HorizontalCaroussel(
                      content: widget.infoLamp)), // getHttp widget.infoLamp
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
                        setColor: () => setColor(Colors.red),
                        color: Colors.red),
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
              valueCursor: widget.cursorValue,
              setBrightness: setBrightness,
            ),
            //TEST

            Expanded(
              child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    SwitchButton(
                      activeText: "  🎉",
                      isSwitched: widget.defaultLamp.partyMode,
                      setSwitch: setSwitchPartyMod,
                      topText: 'Party Mod',
                    ),
                    SwitchButton(
                      activeText: "  🔀",
                      isSwitched: widget.defaultLamp.randomMode,
                      setSwitch: setSwitchRandomMode,
                      topText: "Random Mod",
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(children: <Widget>[
                  SwitchButton(
                    activeText: "  💡",
                    isSwitched: widget.defaultLamp.autoBrightness,
                    setSwitch: setSwitchAutoBrightness,
                    topText: 'Auto Brightness', //
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
