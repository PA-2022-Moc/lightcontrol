import 'package:flutter/material.dart';
import 'package:lightcontrol/model/lamp.dart';
import 'package:lightcontrol/views/my_home_page.dart';

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
  String line1 = "LAMPE INFOS \n";
  String line2 = "||||||||||||||||||||||||||||||||||||||||||||\n";
  String line3 = "  Eteint                             \n";
  //String concatLinesWhenIsOff = "LAMPE INFOS \n" + "||||||||||||||||||||||||||||||||||||||||||||\n" + "  Eteint                             \n";

  String infoLamp = "LAMPE INFOS \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n" +
      "  Eteint                             \n" +
      "||||||||||||||||||||||||||||||||||||||||||||\n"; //lamp.displayInfosLamp();
  //lamp.infos(); //"ALLUMER LA LAMPE";

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
        body: MyHomePage(infoLamp: infoLamp, lamp: lamp),
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
