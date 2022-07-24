import 'package:flutter/material.dart';
import 'package:lightcontrol/services/lamp_service.dart';

class Lamp {
  String id = "";
  String name = "";
  bool start = true;
  bool autoBrightness = false;
  bool randomMode = false;
  bool partyMode = false;
  int brightness = 50;
  String color = "FFFFFF";

  var colorHex = {
    Colors.red: 'FF0000',
    Colors.orange: 'FF8C00',
    Colors.yellow: 'FFFF00',
    Colors.white: 'FFFFFF',
    Colors.green: '008000',
    Colors.lightBlue: '00B0F0',
    Colors.indigo.shade900: '002060',
    Colors.purple: '7030A0',
    Colors.pink.shade400: 'FD6C9E'
  };

  var colorToString = {
    'FF0000': 'Rouge',
    'FF8C00': "Orange",
    'FFFF00': "Jaune",
    'FFFFFF': "Blanc",
    '008000': "Vert",
    '00B0F0': "Bleu clair",
    '002060': "Bleu",
    '7030A0': "Violet",
    'FD6C9E': "Rose",
  };

  String test(String hex) {
    String colorString;
    colorString = colorToString[color]!;
    return colorString;
  }

  void consoleInfos() {
    print("      LAMPE CONSOLE INFOS \n");
    print("||||||||||||||||||||||||||||||||");
    if (start == false) {
      print("| Eteint               \n");
    } else {
      print("| Allumé               \n");
    }

    if (autoBrightness == false) {
      print("| Mode auto brightness désactivé  \n");
    } else {
      print("| Mode auto brightness activé     \n");
    }

    if (randomMode == false) {
      print("| Mode aleatoire désactivé \n");
    } else {
      print("| Mode aleatoire activé    \n");
    }

    print("| brightness à $brightness      \n");
    print("| color à $color       \n");
    print("||||||||||||||||||||||||||||||||\n");
  }

  String displayInfosLampOnScreen() {
    String line3;
    String line4;
    String line5;
    String line5_2;
    String concatLine;

    String line1 = "LAMPE INFOS \n";
    String line2 = "____________________________________\n";
    if (start == false) {
      line3 = "  Eteint                             \n";
    } else {
      line3 = "  Allumé                                    \n";
    }

    if (autoBrightness == false) {
      line4 = "  Mode auto brightness désactivé    \n";
    } else {
      line4 = "  Mode auto brightness activé          \n";
    }

    if (randomMode == false) {
      line5 = "  Mode aleatoire désactivé  \n";
    } else {
      line5 = "  Mode aleatoire activé        \n";
    }

    if (partyMode == false) {
      line5_2 = "  Mode party désactivé  \n";
    } else {
      line5_2 = "  Mode party activé        \n";
    }

    String line6 = "  Luminosité à ${brightness}%         \n";
    String line7 = "  Couleur sélectionné ${test(color)}           \n";

    List<String> concatLinesWhenIsOff = [line1, line2, line3, line2];
    List<String> concatLines = [
      line1,
      line2,
      line3,
      line4,
      line5,
      line5_2,
      line6,
      line7,
      line2
    ];

    if (start == false) {
      concatLine = concatLinesWhenIsOff.join();
      print(concatLines);
    } else {
      concatLine = concatLines.join();
      print(concatLines);
    }
    return concatLine;
  }

  bool switchOnOff() {
    if (start == false) {
      start = true;
    } else {
      start = false;
    }
    return start;
  }

  bool checkIfOn() {
    if (start == false) {
      print("LA LAMPE EST ETEINTE VEUILLEZ L'ALLUMER AVANT");
      return false;
    } else {
      return true;
    }
  }

  void switchAutoBrightness(bool switchMode) {
    // if (auto == false) {
    //   auto = true;
    // } else {
    //   auto = false;
    // }
    autoBrightness = switchMode;
  }

  void switchRandomMode(bool switchMode) {
    // if (music == false) {
    //   music = true;
    // } else {
    //   music = false;
    // }
    randomMode = switchMode;
  }

  void switchPartyMode(bool switchMode) {
    partyMode = switchMode;
  }

  void changeBrightness(int cursor) {
    brightness = cursor;
  }

  void changeColor(String colorSelected) {
    color = colorSelected;
  }

  Lamp init() {
    return Lamp();
  }
}
