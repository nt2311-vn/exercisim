public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        if (speed == 0 || speed == 9 || speed == 10) {
            return speed == 0
                    ? (double) 0
                    : speed == 9 ? (double) speed * 221 * 0.8 : (double) speed * 221 * 0.77;
        } else if (speed >= 5 && speed <= 8) {
            return (double) speed * 221 * 0.9;
        } else {
            return (double) speed * 221;
        }
    }

    public int workingItemsPerMinute(int speed) {
        return (int) productionRatePerHour(speed) / 60;
    }
}
