import 'package:flutter/material.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';
import 'package:lightcontrol/model/lamp.dart';
import 'package:lightcontrol/views/my_home_page.dart';
import 'package:lightcontrol/services/lamp_service.dart';
import 'package:lightcontrol/model/lamp.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
    //You missed initialization part of state object.
  }
}

class _MyAppState extends State<MyApp> {
  Color colorBackground = Colors.blue;
  static Lamp lamp = new Lamp();
  //String concatLinesWhenIsOff = "LAMPE INFOS \n" + "||||||||||||||||||||||||||||||||||||||||||||\n" + "  Eteint                             \n";

  String infoLamp = "LAMPE INFOS \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n" +
      "  Chargement des données                          \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n"; //lamp.displayInfosLamp();
  //lamp.infos(); //"ALLUMER LA LAMPE";

  String _statePower = 'images/power-on.jpeg';

  LampFactory lampFactoryTest = LampFactory();
  LampService lampService = LampService();

  Lamp emptyLamp = Lamp();

  Lamp getLampFromAPI() {
    Lamp defaultLampAPI = Lamp();
    Lamp defaultLamp = Lamp();
    lampService.getLampState(context).then((Lamp result) {
      setState(() {
        defaultLampAPI = result;

        defaultLamp.autoBrightness = defaultLampAPI.autoBrightness;
        defaultLamp.randomMode = defaultLampAPI.randomMode;
        defaultLamp.brightness = defaultLampAPI.brightness;
        defaultLamp.color = defaultLampAPI.color;
        defaultLamp.start = defaultLampAPI.start;

        defaultLamp.consoleInfos();
        infoLamp = defaultLamp.displayInfosLampOnScreen(defaultLamp);
      });
    });

    return defaultLamp;
  }

  late Lamp retrieveLamp = getLampFromAPI();

  void changeStatePower(retrieveLamp) {
    setState(() {
      if (_statePower == 'images/power-off.jpeg') {
        _statePower = 'images/power-on.jpeg';
      } else {
        _statePower = 'images/power-off.jpeg';
      }
      lamp.switchOnOff();
      infoLamp = lamp.displayInfosLampOnScreen(retrieveLamp);

      //lamp.infos();
    });
  }

  void changeColorBackgout(Color newColorBackGround) {
    colorBackground = newColorBackGround;
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
          defaultLamp: retrieveLamp,
          newLamp: lamp,
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
            toolbarHeight: 120.0,
            backgroundColor: colorBackground,
            elevation: 1,
            centerTitle: true,
            title: InkWell(
              onTap: () {
                changeStatePower(retrieveLamp);
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
