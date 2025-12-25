class ProductionRemoteControlCar
    implements RemoteControlCar, Comparable<ProductionRemoteControlCar> {

  private int distance = 0;
  private int numberOfVictories = 0;

  ProductionRemoteControlCar() {
    this.distance = 0;
  }

  public void drive() {
    this.distance += 10;
  }

  public int getDistanceTravelled() {
    return this.distance;
  }

  public int getNumberOfVictories() {
    return this.numberOfVictories;
  }

  public void setNumberOfVictories(int numberOfVictories) {
    this.numberOfVictories = numberOfVictories;
  }

  @Override
  public int compareTo(ProductionRemoteControlCar other) {
    return Integer.compare(other.numberOfVictories, this.numberOfVictories);
  }
}
