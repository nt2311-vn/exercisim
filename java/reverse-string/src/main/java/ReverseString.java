class ReverseString {

  String reverse(String inputString) {

    int i = 0;
    int j = inputString.length() - 1;
    char[] charArr = inputString.toCharArray();
    while (i <= j) {
      char temp = charArr[i];
      charArr[i] = charArr[j];
      charArr[j] = temp;
      i++;
      j--;
    }

    return new String(charArr);
  }
}
