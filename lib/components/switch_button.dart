import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButton extends StatefulWidget {
  final String activeText;
  final bool isSwitched;
  final Function setSwitch;
  const SwitchButton({Key? key, required this.activeText, required this.isSwitched, required this.setSwitch}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text("Auto Brightness"),
            SizedBox(height: 17.0),
            FlutterSwitch(
              activeText: widget.activeText,
              inactiveText: "Off",
              width: 125.0,
              height: 55.0,
              valueFontSize: 25.0,
              toggleSize: 45.0,
              value: widget.isSwitched,
              borderRadius: 30.0,
              padding: 8.0,
              activeColor: Colors.blue.shade100,
              inactiveColor: Colors.grey.shade400,
              showOnOff: true,
              onToggle: (val) {
                widget.setSwitch(val);
              },
            ),
          ],
        ),
      ),
    );
  }
}
