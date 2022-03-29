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

  var colorHex = {Colors.red: 'FF0000', Colors.orange: 'FFC000', Colors.yellow: 'FFFF00', Colors.white: 'FFFFFF', Colors.green: '00B050', Colors.lightBlue: '00B0F0', Colors.indigo.shade900: '002060', Colors.purple: '7030A0', Colors.pink.shade400: 'FD6C9E'};

  String _statePower = 'images/power-off.jpeg';

  void changeStatePower() {
    setState(() {
      if (_statePower == 'images/power-off.jpeg') {
        _statePower = 'images/power-on.jpeg';
      } else {
        _statePower = 'images/power-off.jpeg';
      }
      ;
      lamp.switchOnOff();
      lamp.infos();
    });
  }

  void selectColor(Color color) {
    if (!lamp.checkIfOnOff()) {
      print('allumer la lampe avant de selectionner une couleur');
    } else {
      String colorSelected = colorHex[color]!;
      lamp.changeColor(colorSelected);
      lamp.infos();
    }
  }

  void switchBrightnessMode(bool switchMode) {
    lamp.switchAuto(switchMode);
    lamp.infos();
  }

  void switchMusicMode(bool switchMode) {
    lamp.switchMusic(switchMode);
    lamp.infos();
  }

  void changeBrightnessWithSlider(int curserValue) {
    lamp.changeBrightness(curserValue);
    lamp.infos();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // toute l'app
      title: 'Flutter light control',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyHomePage(),
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
                '$_statePower',
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
  const MyHomePage({Key? key}) : super(key: key);

  //Static MyAppState myAppState = new MyAppState();

  @override
  State<MyHomePage> createState() => _TestHome();
  //State<MyAppState> createState() => _MyAppState();
}

class _TestHome extends State<MyHomePage> {
  final myAppState = _MyAppState();
  var isSwitched = false;
  var isSwitched2 = false;
  double valueCursor = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            widthFactor: 1,
            child: Container(
              color: Colors.grey,
              height: 300,
            ),
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.green,
          //   ),
          // ),

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
                          myAppState.selectColor(Colors.red);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.orange, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.orange);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.yellow, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.yellow);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.white);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.green, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.green);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.lightBlue, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.lightBlue);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.indigo.shade900);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.purple, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.purple);
                        }),
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    child: ElevatedButton(
                        child: Text(""),
                        style: ElevatedButton.styleFrom(primary: Colors.pink.shade400, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                        onPressed: () {
                          myAppState.selectColor(Colors.pink.shade400);
                        }),
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: SfSlider(
                activeColor: Colors.blue.shade100,
                inactiveColor: Colors.grey.shade100,
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
                    myAppState.changeBrightnessWithSlider(valueInt);
                  });
                },
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
                          SizedBox(height: 5.0),
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
                                myAppState.switchBrightnessMode(isSwitched);
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
                          SizedBox(height: 5.0),
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
                                myAppState.switchBrightnessMode(isSwitched2);
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

class _MyHomePageState extends State<MyHomePage> {
  final myAppState = _MyAppState();

  List<bool> _selections = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.red);
                  }),
            ),
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.orange, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.orange);
                  }),
            ),
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.yellow, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.yellow);
                  }),
            ),
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.green);
                  }),
            ),
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.lightBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.lightBlue);
                  }),
            ),
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.indigo.shade900, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.indigo.shade900);
                  }),
            ),
            Spacer(flex: 1),
            Expanded(
              child: ElevatedButton(
                  child: Text(""),
                  style: ElevatedButton.styleFrom(primary: Colors.purple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
                  onPressed: () {
                    myAppState.selectColor(Colors.purple);
                  }),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
