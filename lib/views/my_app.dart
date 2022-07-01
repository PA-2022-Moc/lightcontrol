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
  static Lamp lamp = new Lamp();

  String infoLamp = "LAMPE INFOS \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n" +
      "  Chargement des données                          \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n";

  LampFactory lampFactoryTest = LampFactory();
  LampService lampService = LampService();
  late String statePowerIMG = 'images/power-w.jpeg';
  late Color colorBackground = initColorAppWithAPI('FFFFFF');

  Lamp getLampFromAPI() {
    Lamp defaultLampAPI = Lamp();
    Lamp defaultLamp = Lamp();
    lampService.getLampState(context).then((Lamp result) {
      setState(() {
        defaultLampAPI = result;

        defaultLamp.autoBrightness = defaultLampAPI.autoBrightness;
        defaultLamp.randomMode = defaultLampAPI.randomMode;
        defaultLamp.partyMode = defaultLampAPI.partyMode;
        defaultLamp.brightness = defaultLampAPI.brightness;
        defaultLamp.color = defaultLampAPI.color;
        defaultLamp.start = defaultLampAPI.start;

        defaultLamp.consoleInfos();
        infoLamp = defaultLamp.displayInfosLampOnScreen();
        colorBackground = initColorAppWithAPI(defaultLamp.color);

        if (defaultLamp.start == true) {
          statePowerIMG = 'images/power-on.jpeg';
        } else {
          statePowerIMG = 'images/power-off.jpeg';
        }
      });
    });

    return defaultLamp;
  }

  late Lamp retrieveLamp = getLampFromAPI();

  Color initColorAppWithAPI(String colorHEX) {
    var colorKey = lamp.colorHex.keys.firstWhere(
        (k) => lamp.colorHex[k] == colorHEX,
        orElse: () => Colors.white);
    print(" ici le test ${colorHEX} ");
    return colorKey;
  }

  void changeStatePower(retrieveLamp) {
    bool lampPowerOnOff;
    setState(() {
      if (statePowerIMG == 'images/power-off.jpeg') {
        statePowerIMG = 'images/power-on.jpeg';
      } else {
        statePowerIMG = 'images/power-off.jpeg';
      }
      lampPowerOnOff = retrieveLamp.switchOnOff();
      infoLamp = retrieveLamp.displayInfosLampOnScreen();
      lampService.updateStart(context, lampPowerOnOff);
    });
  }

  void changeColorBackgroundWithColorSelection(
      Lamp lampColor, Color newColorBackGround) {
    setState(() {
      colorBackground = newColorBackGround;
      infoLamp = lampColor.displayInfosLampOnScreen();
      print("on passe a ${colorBackground}");
    });
  }

  String defaultDisplayStartButton() {
    retrieveLamp = getLampFromAPI();
    String IMG;
    if (retrieveLamp.start == true) {
      IMG = 'images/power-on.jpeg';
    } else {
      IMG = 'images/power-off.jpeg';
    }
    return IMG;
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
          changeColorAppBarWithColorSelection:
              changeColorBackgroundWithColorSelection,
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
                statePowerIMG,
                height: 120,
              ),
            ),
          ),
        ), // toute la page
      ),
    );
  }
}
