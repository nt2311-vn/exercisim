class ReverseString {

  String reverse(String inputString) {
    String reversed = "";

    for (int i = 0; i < inputString.length(); i++) {
      reversed = inputString.charAt(i) + reversed;
    }
    return reversed;
  }
}
