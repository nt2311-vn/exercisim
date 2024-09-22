class Leap {

    boolean isLeapYear(int year) {
        return year % 4 == 0 && year % 100 != 0
                ? true
                : year % 100 == 0 && year % 400 == 0 ? true : false;
    }
}
