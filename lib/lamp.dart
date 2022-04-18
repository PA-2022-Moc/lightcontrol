class Lamp {
  bool start = false;
  bool auto = false;
  bool music = false;
  int brightness = 50;
  String color = "00B0F0";

  void infos() {
    print("      LAMPE INFOS \n");
    print("||||||||||||||||||||||||");
    if (start == false) {
      print("| Eteint               |\n");
    } else {
      print("| Allumé               |\n");
    }

    if (auto == false) {
      print("| Mode auto désactivé  |\n");
    } else {
      print("| Mode auto activé     |\n");
    }

    if (music == false) {
      print("| Mode aleatoire désactivé |\n");
    } else {
      print("| Mode aleatoire activé    |\n");
    }

    print("| brightness à $brightness      |\n");
    print("| color à $color       |\n");
    print("|||||||||||||||||||||||| \n");
  }

  String displayInfosLamp() {
    String line3;
    String line4;
    String line5;
    String concatLine;

    String line1 = "LAMPE INFOS \n";
    String line2 = "||||||||||||||||||||||||||||||||||||||||||||\n";
    if (start == false) {
      line3 = "  Eteint                             \n";
    } else {
      line3 = "  Allumé                                    \n";
    }

    if (auto == false) {
      line4 = "  Mode auto désactivé    \n";
    } else {
      line4 = "  Mode auto activé          \n";
    }

    if (music == false) {
      line5 = "  Mode aleatoire désactivé  \n";
    } else {
      line5 = "  Mode aleatoire activé        \n";
    }

    String line6 = "  brightness à $brightness         \n";
    String line7 = "  color à $color                            \n";

    List<String> concatLinesWhenIsOff = [line1, line2, line3, line2];
    List<String> concatLines = [line1, line2, line3, line4, line5, line6, line7, line2];

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

  bool checkIfOnOff() {
    if (start == false) {
      return false;
    } else {
      return true;
    }
  }

  void switchAuto(bool switchMode) {
    // if (auto == false) {
    //   auto = true;
    // } else {
    //   auto = false;
    // }
    auto = switchMode;
  }

  void switchMusic(bool switchMode) {
    // if (music == false) {
    //   music = true;
    // } else {
    //   music = false;
    // }
    music = switchMode;
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
