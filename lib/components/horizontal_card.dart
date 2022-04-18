import 'package:flutter/material.dart';

class HorizontalCaroussel extends StatefulWidget {
  final String content;
  const HorizontalCaroussel({Key? key, required this.content})
      : super(key: key);

  @override
  State<HorizontalCaroussel> createState() => _HorizontalCarousselState();
}

class _HorizontalCarousselState extends State<HorizontalCaroussel> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 800,
          child: PageView.builder(
            itemCount: 2,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: CardContent(_index, widget.content),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget CardContent(int index, String content) {
    if (index == 0) {
      return Text(
        "${content}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          height: 1.5,
        ),
      );
    } else {
      return Text(
        "Card ${index}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, height: 1.5),
      );
    }
  }
}
