// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lightcontrol/views/my_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


// AbsorbPointer(
//               absorbing: true,
//               child: Container(
//                 // container TEST a coller ligne 229 de my_home8page si on veut tester des fonctionalités
//                 color: Colors.red,
//                 height: 80.0,
//                 width: 414,
//                 child: Center(
//                   child: Column(
//                     // add Column
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text('Welcome',
//                           style: TextStyle(
//                               // your text
//                               fontSize: 10.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white)),
//                       RaisedButton(
//                         onPressed: () {
//                           String instruction = "start";
//                           setState(() {
//                             print("truc");
//                             print(valueCursor);

//                             //instructionToAPI(instruction);
//                           });

//                           // print(widget.defaultLamp
//                           //     .displayInfosLampOnScreen(widget.defaultLamp));
//                         },
//                         child: Text('TEST'),
//                       ), // your button beneath text
//                     ],
//                   ),
//                 ),
//               ),
//             ),