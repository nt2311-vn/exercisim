public class GameMaster {

  public String describe(Character character) {
    String charClass = character.getCharacterClass();
    int level = character.getLevel();
    int hitPoints = character.getHitPoints();

    return "You're a level " + level + " " + charClass + " with " + hitPoints + " hit points.";
  }

  public String describe(Destination destination) {
    String name = destination.getName();
    int habitants = destination.getInhabitants();

    return "You've arrived at " + name + ", which has " + habitants + " inhabitants.";
  }

  public String describe(TravelMethod travelMethod) {
    switch (travelMethod) {
      case WALKING:
        return "You're traveling to your destination by walking.";

      default:
        return "You're traveling to your destination on horseback.";
    }
  }

  public String describe(Character character, Destination destination, TravelMethod travelMethod) {
    String describeChar = describe(character);
    String describeDest = describe(destination);
    String describeMethod = describe(travelMethod);

    return describeChar + " " + describeMethod + " " + describeDest;
  }

  public String describe(Character character, Destination destination) {
    String describeChar = describe(character);
    String describeDest = describe(destination);
    String desribeMethod = describe(TravelMethod.WALKING);

    return describeChar + " " + desribeMethod + " " + describeDest;
  }
}
