class BottleSong {

    String recite(int startBottles, int takeDown) {
        var start = takeDown;
        var reciteString = "";

        while (start > 0) {
            reciteString +=
                    numToWord(startBottles)
                            + " green "
                            + pluralOrSingle(startBottles)
                            + " hanging on the wall,\n";
            reciteString +=
                    numToWord(startBottles)
                            + " green "
                            + pluralOrSingle(startBottles)
                            + " hanging on the wall,\n";
            startBottles--;

            reciteString += "And if one green bottle should accidentally fall,\n";
            reciteString +=
                    "There'll be "
                            + numToWord(startBottles).toLowerCase()
                            + " green "
                            + pluralOrSingle(startBottles)
                            + " hanging on the wall.\n";
            start--;
            if (start > 0) {
                reciteString += "\n";
            }
        }

        return reciteString;
    }

    public String numToWord(int num) {
        switch (num) {
            case 10:
                return "Ten";
            case 9:
                return "Nine";
            case 8:
                return "Eight";
            case 7:
                return "Seven";
            case 6:
                return "Six";
            case 5:
                return "Five";
            case 4:
                return "Four";
            case 3:
                return "Three";
            case 2:
                return "Two";
            case 1:
                return "One";
            case 0:
                return "No";
            default:
                return "";
        }
    }

    public String pluralOrSingle(int num) {
        return num == 1 ? "bottle" : "bottles";
    }
}
