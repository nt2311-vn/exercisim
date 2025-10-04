class ArmstrongNumbers {

  boolean isArmstrongNumber(int numberToCheck) {
    String[] numStr = Integer.toString(numberToCheck).split("");
    int sumEachDigit = 0;

    for (int i = numStr.length - 1; i >= 0; i--) {
      int digit = Integer.parseInt(numStr[i]);
      sumEachDigit += (int) Math.pow(digit, numStr.length);
    }

    return sumEachDigit == numberToCheck;
  }
}
