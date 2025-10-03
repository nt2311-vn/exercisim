class Darts {
  int score(double xOfDart, double yOfDart) {
    double radius = Math.sqrt(xOfDart * xOfDart + yOfDart * yOfDart);

    if (radius <= 1.0) {
      return 10;
    }

    if (radius <= 5.0) {
      return 5;
    }

    if (radius <= 10) {
      return 1;
    }

    return 0;
  }
}
