import static org.assertj.core.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class SayTest {

  private Say say = new Say();

  @Test
  @DisplayName("zero")
  public void zero() {
    assertThat(say.say(0)).isEqualTo("zero");
  }

  @Test
  @DisplayName("one")
  public void one() {
    assertThat(say.say(1)).isEqualTo("one");
  }

  @Test
  @DisplayName("fourteen")
  public void fourteen() {
    assertThat(say.say(14)).isEqualTo("fourteen");
  }

  @Test
  @DisplayName("twenty")
  public void twenty() {
    assertThat(say.say(20)).isEqualTo("twenty");
  }

  @Test
  @DisplayName("twenty-two")
  public void twentyTwo() {
    assertThat(say.say(22)).isEqualTo("twenty-two");
  }

  @Test
  @DisplayName("thirty")
  public void thirty() {
    assertThat(say.say(30)).isEqualTo("thirty");
  }

  @Test
  @DisplayName("ninety-nine")
  public void ninetyNine() {
    assertThat(say.say(99)).isEqualTo("ninety-nine");
  }

  @Test
  @DisplayName("one hundred")
  public void oneHundred() {
    assertThat(say.say(100)).isEqualTo("one hundred");
  }

  @Test
  @DisplayName("one hundred twenty-three")
  public void oneHundredTwentyThree() {
    assertThat(say.say(123)).isEqualTo("one hundred twenty-three");
  }

  @Test
  @DisplayName("two hundred")
  public void twoHundred() {
    assertThat(say.say(200)).isEqualTo("two hundred");
  }

  @Test
  @DisplayName("nine hundred ninety-nine")
  public void nineHundredNinetyNine() {
    assertThat(say.say(999)).isEqualTo("nine hundred ninety-nine");
  }

  @Test
  @DisplayName("one thousand")
  public void oneThousand() {
    assertThat(say.say(1_000)).isEqualTo("one thousand");
  }

  @Test
  @DisplayName("one thousand two hundred thirty-four")
  public void oneThousandTwoHundredThirtyFour() {
    assertThat(say.say(1_234)).isEqualTo("one thousand two hundred thirty-four");
  }

  @Test
  @DisplayName("one million")
  public void oneMillion() {
    assertThat(say.say(1_000_000)).isEqualTo("one million");
  }

  @Test
  @DisplayName("one million two thousand three hundred forty-five")
  public void oneMillionTwoThousandThreeHundredFortyFive() {
    assertThat(say.say(1_002_345)).isEqualTo("one million two thousand three hundred forty-five");
  }

  @Test
  @DisplayName("one billion")
  public void oneBillion() {
    assertThat(say.say(1_000_000_000)).isEqualTo("one billion");
  }

  @Test
  @DisplayName("a big number")
  public void
      nineHundredEightySevenBillionSixHundredFiftyFourThreeHundredTwentyOneThousandOneHundredTwentyThree() {
    assertThat(say.say(987_654_321_123L))
        .isEqualTo(
            "nine hundred eighty-seven billion six hundred fifty-four million"
                + " three hundred twenty-one thousand one hundred twenty-three");
  }

  @Test
  @DisplayName("numbers below zero are out of range")
  public void illegalNegativeNumber() {
    assertThatExceptionOfType(IllegalArgumentException.class).isThrownBy(() -> say.say(-1));
  }

  @Test
  @DisplayName("numbers above 999,999,999,999 are out of range")
  public void illegalTooBigNumber() {
    assertThatExceptionOfType(IllegalArgumentException.class)
        .isThrownBy(() -> say.say(1_000_000_000_000L));
  }
}
