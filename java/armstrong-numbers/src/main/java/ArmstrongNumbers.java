class ArmstrongNumbers {

  boolean isArmstrongNumber(int numberToCheck) {
    String[] numStr = Integer.toString(numberToCheck).split("");
    int sumEachDigit = 0;

    for (String digitStr : numStr) {
      int digit = Integer.parseInt(digitStr);
      sumEachDigit += (int) Math.pow(digit, numStr.length);
    }

    return sumEachDigit == numberToCheck;
  }
}
