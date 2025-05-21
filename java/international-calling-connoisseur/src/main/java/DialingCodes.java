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
    if (!this.map.containsKey(code) && !this.map.containsValue(country)) {
      this.map.put(code, country);
    }
  }

  public Integer findDialingCode(String country) {

    if (this.map.containsValue(country)) {
      for (Integer code : this.map.keySet()) {
        if (this.map.get(code) == country) {
          return code;
        }
      }
    }

    return null;
  }

  public void updateCountryDialingCode(Integer code, String country) {
    if (findDialingCode(country) != null) {
      this.map.remove(findDialingCode(country));
      this.map.put(code, country);
    }
  }
}
