import java.util.ArrayList;
import java.util.List;
import java.util.Random;

class DnDCharacter {

  private int strength;
  private int dexterity;
  private int consitution;
  private int intelligence;
  private int wisdom;
  private int charisma;
  private int charModifier;
  private int hitpoints;

  public DnDCharacter() {

    this.strength = ability(rollDice());
    this.dexterity = ability(rollDice());
    this.consitution = ability(rollDice());
    this.intelligence = ability(rollDice());
    this.wisdom = ability(rollDice());
    this.charisma = ability(rollDice());
    this.charModifier = modifier(consitution);
    this.hitpoints = 10 + this.charModifier;
  }

  int ability(List<Integer> scores) {
    int min = 7;
    int sum = 0;

    for (int i = 0; i < scores.size(); i++) {
      int currentValue = scores.get(i);
      if (currentValue < min) {
        min = currentValue;
      }

      sum += currentValue;
    }

    return sum - min;
  }

  List<Integer> rollDice() {
    Random rand = new Random();

    List<Integer> dices = new ArrayList<>();

    for (int i = 0; i < 4; i++) {
      dices.add((int) (rand.nextInt(6) + 1));
    }

    return dices;
  }

  int modifier(int input) {
    return Math.floorDiv(input - 10, 2);
  }

  int getStrength() {
    return this.strength;
  }

  int getDexterity() {
    return this.dexterity;
  }

  int getConstitution() {
    return this.consitution;
  }

  int getIntelligence() {
    return this.intelligence;
  }

  int getWisdom() {
    return this.wisdom;
  }

  int getCharisma() {
    return this.charisma;
  }

  int getHitpoints() {
    return this.hitpoints;
  }
}
