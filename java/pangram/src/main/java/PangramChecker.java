import java.util.HashSet;

public class PangramChecker {

  public boolean isPangram(String input) {
    if (input.isEmpty()) {
      return false;
    }

    HashSet<Character> alphabets = new HashSet<>();

    final char[] str = input.toLowerCase().replaceAll(" ", "").toCharArray();

    for (char c : str) {
      if (Character.isAlphabetic(c)) {
        alphabets.add(c);
      }
    }

    return alphabets.size() == 26;
  }
}
