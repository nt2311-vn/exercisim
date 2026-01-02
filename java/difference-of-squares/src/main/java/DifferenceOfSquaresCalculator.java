import java.util.stream.IntStream;

class DifferenceOfSquaresCalculator {

  int computeSquareOfSumTo(int input) {
    Integer sumOverRange = IntStream.range(1, input + 1).sum();

    return sumOverRange * sumOverRange;
  }

  int computeSumOfSquaresTo(int input) {
    return IntStream.range(1, input + 1).map(num -> num * num).sum();
  }

  int computeDifferenceOfSquares(int input) {
    return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
  }
}
