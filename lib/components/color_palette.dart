import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final VoidCallback setColor;
  final Color color;
  const ColorPalette({Key? key, required this.setColor, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
      child: Text(""),
      style: ElevatedButton.styleFrom(primary: color, elevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
      onPressed: setColor,
    ));
  }
}
