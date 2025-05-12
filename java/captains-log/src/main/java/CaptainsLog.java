import java.util.Random;

class CaptainsLog {

  private static final char[] PLANET_CLASSES =
      new char[] {'D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y'};

  private Random random;

  CaptainsLog(Random random) {
    this.random = random;
  }

  char randomPlanetClass() {
    final int randomNumber = this.random.nextInt(PLANET_CLASSES.length);

    return PLANET_CLASSES[randomNumber];
  }

  String randomShipRegistryNumber() {
    final int registryNumber = 1000 + this.random.nextInt(9000);

    return "NCC-" + registryNumber;
  }

  double randomStardate() {
    return 41000 + 1000 * this.random.nextDouble();
  }
}
