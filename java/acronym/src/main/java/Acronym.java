import java.util.Arrays;
import java.util.stream.Collectors;

class Acronym {
  private String phrase;

  Acronym(String phrase) {
    this.phrase = phrase;
  }

  String get() {
    return Arrays.asList(this.phrase.replaceAll("_", "").replaceAll("-", " ").split(" ")).stream()
        .filter(word -> word != " " && word != "")
        .map(word -> Character.toString(word.charAt(0)).toUpperCase())
        .collect(Collectors.joining(""));
  }
}
