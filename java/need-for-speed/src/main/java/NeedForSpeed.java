class NeedForSpeed {
  private final int speed;
  private final int batteryDrain;
  private int battery;
  private int distance;

  NeedForSpeed(int speed, int batteryDrain) {
    this.speed = speed;
    this.batteryDrain = batteryDrain;
    this.battery = 100;
    this.distance = 0;
  }

  public boolean batteryDrained() {
    return this.battery < this.batteryDrain;
  }

  public int distanceDriven() {
    return this.distance;
  }

  public void drive() {
    if (!batteryDrained()) {
      this.distance += this.speed;
      this.battery -= this.batteryDrain;
    }
  }

  public static NeedForSpeed nitro() {
    return new NeedForSpeed(50, 4);
  }
}

class RaceTrack {
  private int distance;

  RaceTrack(int distance) {
    this.distance = distance;
  }

  public boolean canFinishRace(NeedForSpeed car) {
    while (car.distanceDriven() < this.distance && !car.batteryDrained()) {
      car.drive();
    }

    return car.distanceDriven() >= this.distance;
  }
}
