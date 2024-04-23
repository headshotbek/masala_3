import 'dart:math';

void main(List<String> arguments) {
  List<Instrument> band = [Guitar(), Piano()];

  for (var instrument in band) {
    print("${instrument.getName()} is Playing!");
    instrument.playSound();

    if (instrument is Tunable) {
      if (Random().nextBool()) {
        instrument.tuneUp();
      } else {
        instrument.tuneDown();
      }
    }
  }
}

abstract class Instrument {
  // ! Musiqa asbobini nomini qaytaradi
  String getName();

  // ! Musiqa asbobini ovzini qaytaradi
  void playSound();
}

class Guitar extends Instrument with Tunable {
  @override
  String getName() {
    return "Gitara";
  }

  @override
  void playSound() {
    print("Strumm");
  }
}

class Piano extends Instrument with Tunable {
  @override
  String getName() {
    return "Pianina";
  }

  @override
  void playSound() {
    print("Ding ding");
  }
}

mixin Tunable on Instrument {
  // ! Musiqa asbobini ovozini ko'taradi
  void tuneUp() {
    print("Ovoz ko'tarildi");
  }

  // ! Musiqa asbobini ovozini pasaytiradi
  void tuneDown() {
    print("Ovoz pasaytirildi");
  }
}
