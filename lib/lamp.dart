class Lamp {
  bool start = false;
  bool auto = false;
  bool music = false;
  int brightness = 50;
  String color = "FFFFFF";

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
      print("| Mode music désactivé |\n");
    } else {
      print("| Mode music activé    |\n");
    }

    print("| brightness à $brightness      |\n");
    print("| color à $color       |\n");
    print("|||||||||||||||||||||||| \n");
  }

  void switchOnOff() {
    if (start == false) {
      start = true;
    } else {
      start = false;
    }
  }

  void switchAuto() {
    if (auto == false) {
      auto = true;
    } else {
      auto = false;
    }
  }

  void switchMusic() {
    if (music == false) {
      music = true;
    } else {
      music = false;
    }
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
