import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lightcontrol/lamp.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.red, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.red);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.orange, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.orange);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.yellow, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.yellow);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          selectColor(Colors.white);
                          setState(() {
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.green, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          selectColor(Colors.green);
                          setState(() {
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.lightBlue, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.lightBlue);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.indigo.shade900);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.purple, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.purple);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.pink.shade400, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            selectColor(Colors.pink.shade400);
                            widget.infoLamp = displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            // les switch button
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text("🔅                                    Brightness                                   🔆"),
                          SizedBox(height: 1.0),
                          SfSlider(
                            activeColor: Colors.yellow.shade600,
                            inactiveColor: Colors.yellow.shade200,
                            min: 0,
                            max: 100,
                            value: valueCursor,
                            interval: 100,
                            showTicks: false,
                            showLabels: true,
                            enableTooltip: true,
                            onChanged: (dynamic value) {
                              setState(() {
                                valueCursor = value;
                                int valueInt = valueCursor.toInt();
                                changeBrightnessWithSlider(valueInt);
                                widget.infoLamp = displayLampInfos();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            // les switch button
            child: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text("Auto Brightness"),
                          SizedBox(height: 17.0),
                          FlutterSwitch(
                            activeText: "  💡",
                            inactiveText: "Off",
                            width: 125.0,
                            height: 55.0,
                            valueFontSize: 25.0,
                            toggleSize: 45.0,
                            value: isSwitched,
                            borderRadius: 30.0,
                            padding: 8.0,
                            activeColor: Colors.blue.shade100,
                            inactiveColor: Colors.grey.shade400,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                isSwitched = val;
                                switchBrightnessMode(isSwitched);
                                widget.infoLamp = displayLampInfos();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text("Music Mod"),
                          SizedBox(height: 17.0),
                          FlutterSwitch(
                            activeText: "  🎵",
                            inactiveText: "Off",
                            width: 125.0,
                            height: 55.0,
                            valueFontSize: 25.0,
                            toggleSize: 45.0,
                            value: isSwitched2,
                            borderRadius: 30.0,
                            padding: 8.0,
                            activeColor: Colors.blue.shade100,
                            inactiveColor: Colors.grey.shade400,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                isSwitched2 = val;
                                switchMusicMode(isSwitched2);
                                widget.infoLamp = displayLampInfos();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
