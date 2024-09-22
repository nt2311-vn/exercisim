public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int actual) {
        return expectedMinutesInOven() - actual;
    }

    public int preparationTimeInMinutes(int layers) {
        return 2 * layers;
    }

    public int totalTimeInMinutes(int layers, int actual) {
        return preparationTimeInMinutes(layers) + actual;
    }
}
