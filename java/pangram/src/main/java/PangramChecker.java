public class PangramChecker {

  public boolean isPangram(String input) {
    return input.toLowerCase().replaceAll("[^a-z]", "").chars().distinct().count() == 26;
  }
}
