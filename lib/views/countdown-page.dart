import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../components/round-button.dart';
import '../services/lamp_service.dart';
import 'my_app.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  LampService lampService = LampService();
  Duration? count2;
  late Timer? t;

  bool isPlaying = false;

  bool isPopAble(bool isplayingOrDone) {
    bool isPopable;
    if (isplayingOrDone == true) {
      isPopable = false;
    } else {
      isPopable = true;
    }
    return isPopable;
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    count2 = count;

    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isPopAble(isPlaying),
      child: Scaffold(
        backgroundColor: Color(0xfff5fbff),
        body: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  padding: EdgeInsets.only(right: 50.0, top: 40, bottom: 40),
                  icon: const Icon(Icons.close_outlined, size: 60.0),
                  onPressed: () {
                    if (isPlaying) {
                      print("non");
                      openDialog();
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MyApp();
                        },
                        fullscreenDialog: true,
                      ));
                    }
                  }),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.shade300,
                      value: progress,
                      strokeWidth: 6,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.isDismissed) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            height: 300,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: controller.duration!,
                              onTimerDurationChanged: (time) {
                                setState(() {
                                  controller.duration = time;
                                });
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) => Text(
                        countText,
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!controller.isAnimating) {
                        print("test play");
                        controller.reverse(
                            from:
                                controller.value == 0 ? 1.0 : controller.value);
                        t = Timer(count2!, () {
                          print("fin du timer");
                          lampService.updateStart(context, false);
                        });

                        setState(() {
                          isPlaying = true;
                          //t!.cancel();
                        });
                      } else {
                        print("test pause");
                        controller.stop();
                        setState(() {
                          isPlaying = false;
                          t!.cancel();
                        });
                      }
                    },
                    child: RoundButton(
                      icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.reset();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                    child: RoundButton(
                      icon: Icons.stop,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Attention'),
          content: Text("Veuillez arrêter le Timer avant de le fermer"),
          actions: [],
        ),
      );
}

// const AlertDialog(
//                           title: Text("Attention"),
//                           content: Text(
//                               "Veuillez arrêter le Timer avant de la fermer"),
//                           actions: []);
