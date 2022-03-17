import 'package:flutter/material.dart';
import 'package:lightcontrol/lamp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Lamp lamp = new Lamp();

  String _statePower = 'images/power-off.jpeg';
  void _changeStatePower() {
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
                _changeStatePower();
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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
