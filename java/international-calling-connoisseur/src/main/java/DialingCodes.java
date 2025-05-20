import java.util.Map;

public class DialingCodes {
  private Map<Integer, String> map = new HashMap<>();

  public Map<Integer, String> getCodes() {
    return map;
  }

  public void setDialingCode(Integer code, String country) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  public String getCountry(Integer code) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  public void addNewDialingCode(Integer code, String country) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  public Integer findDialingCode(String country) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }

  public void updateCountryDialingCode(Integer code, String country) {
    throw new UnsupportedOperationException(
        "Delete this statement and write your own implementation.");
  }
}
