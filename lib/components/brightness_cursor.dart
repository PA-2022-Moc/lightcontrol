import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BrightnessCursor extends StatefulWidget {
  final double valueCursor;
  final Function setBrightness;
  const BrightnessCursor({
    Key? key,
    required this.valueCursor,
    required this.setBrightness,
  }) : super(key: key);

  @override
  State<BrightnessCursor> createState() => _BrightnessCursorState();
}

class _BrightnessCursorState extends State<BrightnessCursor> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    Text("🔅                                    Brightness                                   🔆"),
                    SizedBox(height: 1.0),
                    SfSlider(
                      activeColor: Colors.yellow.shade600,
                      inactiveColor: Colors.yellow.shade200,
                      min: 0,
                      max: 100,
                      value: widget.valueCursor,
                      interval: 100,
                      showTicks: false,
                      showLabels: true,
                      enableTooltip: true,
                      onChanged: (dynamic value) {
                        widget.setBrightness(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
