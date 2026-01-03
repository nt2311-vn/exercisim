public class Hamming {

  private int distance = 0;

  public Hamming(String leftStrand, String rightStrand) {
    if (leftStrand.length() != rightStrand.length()) {
      throw new IllegalArgumentException("strands must be of equal length");
    }

    for (int i = 0; i < leftStrand.length(); i++) {
      if (leftStrand.charAt(i) != rightStrand.charAt(i)) {
        this.distance++;
      }
    }
  }

  public int getHammingDistance() {
    return this.distance;
  }
}
