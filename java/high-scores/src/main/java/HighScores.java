import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class HighScores {

  private List<Integer> highScores = new ArrayList<>();
  private List<Integer> originalScores;

  public HighScores(List<Integer> highScores) {
    for (int i = 0; i < highScores.size(); i++) {
      this.highScores.add(highScores.get(i));
    }

    this.originalScores = highScores;
  }

  List<Integer> scores() {
    return this.originalScores;
  }

  Integer latest() {
    return this.highScores.getLast();
  }

  Integer personalBest() {
    return Collections.max(this.highScores);
  }

  List<Integer> personalTopThree() {
    Collections.sort(this.highScores, Collections.reverseOrder());

    if (this.highScores.size() <= 3) {
      return this.highScores;
    }

    this.highScores = this.highScores.subList(0, 3);
    return this.highScores;
  }
}
