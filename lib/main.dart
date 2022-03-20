import 'package:flutter/material.dart';
import 'package:lightcontrol/lamp.dart';

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

  var colorHex = {Colors.red: 'FF0000', Colors.orange: 'FFC000', Colors.yellow: 'FFFF00', Colors.green: '00B050', Colors.lightBlue: '00B0F0', Colors.indigo.shade900: '002060', Colors.purple: '7030A0'};

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
  State<MyHomePage> createState() => _MyHomePageState();
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
      )),
    );
  }
}
