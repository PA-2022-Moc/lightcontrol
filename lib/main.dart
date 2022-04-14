import 'package:flutter/material.dart';
import 'package:lightcontrol/lamp.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    //You missed initialization part of state object.
  }
}

class _MyAppState extends State<MyApp> {
  static Lamp lamp = new Lamp();
  String line1 = "LAMPE INFOS \n";
  String line2 = "||||||||||||||||||||||||||||||||||||||||||||\n";
  String line3 = "  Eteint                             \n";
  //String concatLinesWhenIsOff = "LAMPE INFOS \n" + "||||||||||||||||||||||||||||||||||||||||||||\n" + "  Eteint                             \n";

  String infoLamp = "LAMPE INFOS \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n" +
      "  Eteint                             \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n"; //lamp.displayInfosLamp();
  //lamp.infos(); //"ALLUMER LA LAMPE";

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

  String _statePower = 'images/power-off.jpeg';

  void changeStatePower() {
    setState(() {
      if (_statePower == 'images/power-off.jpeg') {
        _statePower = 'images/power-on.jpeg';
      } else {
        _statePower = 'images/power-off.jpeg';
      }
        lamp.switchOnOff();
        infoLamp = lamp.displayInfosLamp();

      //lamp.infos();
    });
  }

  void selectColor(Color color) {
    if (!lamp.checkIfOnOff()) {
      print('allumer la lampe avant de selectionner une couleur');
    } else {
      String colorSelected = colorHex[color]!;
      lamp.changeColor(colorSelected);
    }
    //lamp.infos();
  }

  void switchBrightnessMode(bool switchMode) {
    lamp.switchAuto(switchMode);
  }

  void switchMusicMode(bool switchMode) {
    lamp.switchMusic(switchMode);
  }

  void changeBrightnessWithSlider(int curserValue) {
    lamp.changeBrightness(curserValue);
  }

  String displayLampInfos() {
    return lamp.displayInfosLamp();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // toute l'app
      title: 'Flutter light control',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(
          infoLamp: infoLamp,
          displayLampInfos: displayLampInfos,
          selectColor: selectColor,
          changeBrightnessWithSlider: changeBrightnessWithSlider,
          switchBrightnessMode: switchBrightnessMode,
          switchMusicMode: switchMusicMode,
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
            toolbarHeight: 120.0,
            backgroundColor: Colors.blue.shade400,
            elevation: 1,
            centerTitle: true,
            title: InkWell(
              onTap: () {
                changeStatePower();
              },
              child: Image.asset(
                _statePower,
                height: 120,
              ),
            ),
          ),
        ), // toute la page
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String infoLamp;
  final Function displayLampInfos;
  final Function selectColor;
  final Function changeBrightnessWithSlider;
  final Function switchMusicMode;
  final Function switchBrightnessMode;
  MyHomePage(
      {Key? key,
      required this.infoLamp,
      required this.displayLampInfos,
      required this.selectColor,
      required this.changeBrightnessWithSlider,
      required this.switchMusicMode,
      required this.switchBrightnessMode})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  double valueCursor = 50.0; // 50,0

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
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.red);
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.orange);
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.yellow);
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          widget.selectColor(Colors.white);
                          setState(() {
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          widget.selectColor(Colors.green);
                          setState(() {
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.lightBlue);
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.shade900,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.indigo.shade900);
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.purple);
                            widget.infoLamp = widget.displayLampInfos();
                          });
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink.shade400,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          setState(() {
                            widget.selectColor(Colors.pink.shade400);
                            widget.infoLamp = widget.displayLampInfos();
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
                          Text(
                              "🔅                                    Brightness                                   🔆"),
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
                                widget.changeBrightnessWithSlider(valueInt);
                                widget.infoLamp = widget.displayLampInfos();
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
                                widget.switchBrightnessMode(isSwitched);
                                widget.infoLamp = widget.displayLampInfos();
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
                                widget.switchMusicMode(isSwitched2);
                                widget.infoLamp = widget.displayLampInfos();
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

// class _MyHomePageState extends State<MyHomePage> {
//   final myAppState = _MyAppState();

//   List<bool> _selections = List.generate(7, (_) => false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.red);
//                   }),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.orange);
//                   }),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.yellow, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.yellow);
//                   }),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.green);
//                   }),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.lightBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.lightBlue);
//                   }),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.indigo.shade900);
//                   }),
//             ),
//             Spacer(flex: 1),
//             Expanded(
//               child: ElevatedButton(
//                   child: Text(""),
//                   style: ElevatedButton.styleFrom(primary: Colors.purple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
//                   onPressed: () {
//                     myAppState.selectColor(Colors.purple);
//                   }),
//             ),
//             Spacer(flex: 1),
//           ],
//         ),
//       ),
//     );
//   }
// }
