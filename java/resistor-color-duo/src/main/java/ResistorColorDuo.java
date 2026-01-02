import java.util.Arrays;
import java.util.List;

class ResistorColorDuo {
  private final String[] allColors = {
    "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"
  };

  String colorValue(String color) {
    return Integer.toString(Arrays.asList(allColors).indexOf(color));
  }

  int value(String[] colors) {
    String result = "";

    List<String> listOfTwo = Arrays.asList(colors).subList(0, 2);

    for (int i = 0; i < listOfTwo.size(); i++) {
      result += colorValue(listOfTwo.get(i));
    }

    return Integer.parseInt(result);
  }
}
