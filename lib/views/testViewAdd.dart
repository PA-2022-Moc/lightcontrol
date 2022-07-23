import 'package:flutter/material.dart';

class AddBook extends StatefulWidget {
  AddBook({
    Key? key,
  }) : super(key: key);

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  var titleView = "Ajouter Livre 📖";
  List<String> categories = [];
  String dataUrlGif = 'data:text/plain;base64,SGVsbG8sIFdvcmxkIQ==';
  List<String> concatLinesUrlTab = [];
  String? concatUrl1 =
      "https://flutterfirebase1.page.link/?link=https://flutterfirebase1.page.link/share?bookid=";
  String? concatUrl3 = "&apn=com.example.flutter_firebase_1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(" TRUC TEST")),
    );
  }
}
