class Fighter {

  boolean isVulnerable() {
    return true;
  }

  int getDamagePoints(Fighter fighter) {
    return 1;
  }

  public String toString() {
    return "Fighter is Fighter";
  }
}

// TODO: define the Warrior class
class Warrior extends Fighter {

  @Override
  public String toString() {
    return "Fighter is a Warrior";
  }

  @Override
  boolean isVulnerable() {
    return false;
  }

  @Override
  int getDamagePoints(Fighter fighter) {
    if (fighter.isVulnerable()) {
      return 10;
    }

    return 6;
  }
}

// TODO: define the Wizard class
class Wizard extends Fighter {
  private boolean _preparedSpell = false;

  void prepareSpell() {
    this._preparedSpell = true;
  }

  @Override
  public String toString() {
    return "Fighter is a Wizard";
  }

  @Override
  boolean isVulnerable() {
    if (this._preparedSpell) {
      return false;
    }

    return true;
  }

  @Override
  int getDamagePoints(Fighter fighter) {
    if (this._preparedSpell) {
      return 12;
    }

    return 3;
  }
}
