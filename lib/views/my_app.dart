import 'package:flutter/material.dart';
import 'package:lightcontrol/factory/lamp_factory.dart';
import 'package:lightcontrol/model/lamp.dart';
import 'package:lightcontrol/views/countdown-page.dart';
import 'package:lightcontrol/views/my_home_page.dart';
import 'package:lightcontrol/services/lamp_service.dart';
import 'package:lightcontrol/model/lamp.dart';
import 'package:lightcontrol/views/testViewAdd.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
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
  Lamp defaultLampAPI = Lamp();
  Lamp defaultLamp = Lamp();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  NavigatorState? get _navigator => _navigatorKey.currentState;

  Lamp getLampFromAPI() {
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
    var colorKey = retrieveLamp.colorHex.keys.firstWhere(
        (k) => retrieveLamp.colorHex[k] == colorHEX,
        orElse: () => Colors.white);
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
    Future openDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Planifier un Arrêt'),
            content: CountdownPage(),
          ),
        );
    return MaterialApp(
      // toute l'app
      title: 'Flutter light control',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      home: Scaffold(
        body: MyHomePage(
          cursorValue: defaultLampAPI.brightness.toDouble(),
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
            actions: [
              IconButton(
                  padding: EdgeInsets.only(right: 10.0),
                  icon: const Icon(Icons.timer, size: 45.0),
                  onPressed: () {
                    print("okay time");
                    _navigator?.push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CountdownPage();
                        },
              
                        fullscreenDialog: true,
                      ),
                    );
                  }),
            ],
          ),
        ), // toute la page
      ),
    );
  }
}
