import java.util.HashMap;
import java.util.Map;

public class DialingCodes {

  private Map<Integer, String> map = new HashMap<>();

  public Map<Integer, String> getCodes() {
    return this.map;
  }

  public void setDialingCode(Integer code, String country) {
    this.map.put(code, country);
  }

  public String getCountry(Integer code) {
    return this.map.get(code);
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
