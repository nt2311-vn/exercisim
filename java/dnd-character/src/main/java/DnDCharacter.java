import java.util.ArrayList;
import java.util.List;

class DnDCharacter {

  private int strength;
  private int dexterity;
  private int constitution;
  private int intelligence;
  private int charisma;
  private int wisdom;
  private int hitpoints;

  public DnDCharacter() {}

  int ability(List<Integer> scores) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  List<Integer> rollDice() {
    List<Integer> dices = new ArrayList<>();

    for (int i = 0; i < 4; i++) {
      dices.add((int) (Math.random() * 6 + 1));
    }
    return dices;
  }

  int modifier(int input) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getStrength() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getDexterity() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getConstitution() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getIntelligence() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getWisdom() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getCharisma() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  int getHitpoints() {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }
}
