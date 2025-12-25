class Darts {
  int score(double xOfDart, double yOfDart) {
    double squrRadis = xOfDart * xOfDart + yOfDart * yOfDart;

    if (squrRadis <= 1.0) {
      return 10;
    }

    if (squrRadis <= 25.0) {
      return 5;
    }

    if (squrRadis <= 100.0) {
      return 1;
    }

    return 0;
  }
}
