import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class ResistorColorDuoTest {
  private ResistorColorDuo resistorColorDuo;

  @BeforeEach
  public void setup() {
    resistorColorDuo = new ResistorColorDuo();
  }

  @Test
  @DisplayName("Brown and black")
  public void testBrownAndBlack() {
    assertThat(resistorColorDuo.value(new String[] {"brown", "black"})).isEqualTo(10);
  }

  @Test
  @DisplayName("Blue and grey")
  public void testBlueAndGrey() {
    assertThat(resistorColorDuo.value(new String[] {"blue", "grey"})).isEqualTo(68);
  }

  @Test
  @DisplayName("Yellow and violet")
  public void testYellowAndViolet() {
    assertThat(resistorColorDuo.value(new String[] {"yellow", "violet"})).isEqualTo(47);
  }

  @Test
  @DisplayName("Orange and orange")
  public void testOrangeAndOrange() {
    assertThat(resistorColorDuo.value(new String[] {"orange", "orange"})).isEqualTo(33);
  }

  @Test
  @DisplayName("White and red")
  public void testWhiteAndRed() {
    assertThat(resistorColorDuo.value(new String[] {"white", "red"})).isEqualTo(92);
  }

  @Test
  @DisplayName("Black and brown, one-digit")
  public void testBlackAndBrownOneDigit() {
    assertThat(resistorColorDuo.value(new String[] {"black", "brown"})).isEqualTo(1);
  }

  @Test
  @DisplayName("Ignore additional colors")
  public void testIgnoreAdditionalColors() {
    assertThat(resistorColorDuo.value(new String[] {"green", "brown", "orange"})).isEqualTo(51);
  }
}
