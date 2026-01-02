import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

class HighScores {

  private List<Integer> highScores;

  public HighScores(List<Integer> highScores) {
    this.highScores = highScores;
  }

  List<Integer> scores() {
    return this.highScores;
  }

  Integer latest() {
    return this.highScores.get(this.highScores.size() - 1);
  }

  Integer personalBest() {
    return Collections.max(this.highScores);
  }

  List<Integer> personalTopThree() {
    return this.highScores.stream()
        .sorted(Comparator.reverseOrder())
        .limit(3)
        .collect(Collectors.toList());
  }
}
