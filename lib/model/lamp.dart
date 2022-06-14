class Lamp {
  String id = "";
  String name = "";
  bool start = false;
  bool autoBrightness = false;
  bool randomMode = false;
  int brightness = 50;
  String color = "00B0F0";

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

  String displayInfosLampOnScreen(Lamp lamp) {
    String line3;
    String line4;
    String line5;
    String concatLine;

    String line1 = "LAMPE INFOS \n";
    String line2 = "||||||||||||||||||||||||||||||||||||||||||||\n";
    if (lamp.start == false) {
      line3 = "  Eteint                             \n";
    } else {
      line3 = "  Allumé                                    \n";
    }

    if (lamp.autoBrightness == false) {
      line4 = "  Mode auto brightness désactivé    \n";
    } else {
      line4 = "  Mode auto brightness activé          \n";
    }

    if (lamp.randomMode == false) {
      line5 = "  Mode aleatoire désactivé  \n";
    } else {
      line5 = "  Mode aleatoire activé        \n";
    }

    String line6 = "  brightness à ${lamp.brightness}         \n";
    String line7 = "  color à ${lamp.color}                            \n";

    List<String> concatLinesWhenIsOff = [line1, line2, line3, line2];
    List<String> concatLines = [
      line1,
      line2,
      line3,
      line4,
      line5,
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
    //print("qdqdqzdqdqdz");
    return concatLine;
  }

  void switchOnOff() {
    if (start == false) {
      start = true;
    } else {
      start = false;
    }
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
