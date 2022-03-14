import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _statePower = 'images/power-off.jpeg';
  void _changeStatePower() {
    setState(() {
      if (_statePower == 'images/power-off.jpeg') {
        _statePower = 'images/power-on.jpeg';
      } else {
        _statePower = 'images/power-off.jpeg';
      }
      ;
      print(_statePower);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // toute l'app
      title: 'Flutter light control',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          elevation: 1,
          centerTitle: true,
          title: InkWell(
            onTap: () {
              _changeStatePower();
            },
            child: Image.asset(
              '$_statePower',
              height: 60,
            ),
          ),
        ), // toute la page
      ),
    );
  }
}
