import java.util.Arrays;
import java.util.List;

class ResistorColorTrio {
  private final List<String> allColors =
      Arrays.asList(
          "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white");

  Integer colorValue(String color) {
    return allColors.indexOf(color);
  }

  String labelConvert(Long resitorValue) {
    if (resitorValue >= 1_000_000_000) {
      return (resitorValue / 1_000_000_000) + " gigaohms";
    }

    if (resitorValue >= 1_000_000) {
      return (resitorValue / 1_000_000) + " megaohms";
    }

    if (resitorValue >= 1_000) {
      return (resitorValue / 1_000) + " kiloohms";
    }

    return resitorValue + " ohms";
  }

  String label(String[] colors) {

    Long resitorValue = (long) (colorValue(colors[0]) * 10 + colorValue(colors[1]));
    Long zeroNeeds = (long) Math.pow(10, colorValue(colors[2]));
    Long totalResitorValue = resitorValue * zeroNeeds;

    return labelConvert(totalResitorValue);
  }
}
