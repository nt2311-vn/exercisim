import java.util.Arrays;
import java.util.List;

class ResistorColorDuo {
  private final List<String> allColors =
      Arrays.asList(
          "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white");

  int value(String[] colors) {

    return allColors.indexOf(colors[0]) * 10 + allColors.indexOf(colors[1]);
  }
}
