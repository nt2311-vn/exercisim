class RaindropConverter {

    String convert(int number) {
        var response = "";

        if (number % 3 != 0 && number % 5 != 0 && number % 7 != 0) {
            return response += String.valueOf(number);
        }
        if (number % 3 == 0) {
            response += "Pling";
        }

        if (number % 5 == 0) {
            response += "Plang";
        }

        if (number % 7 == 0) {
            response += "Plong";
        }
        return response;
    }
}
