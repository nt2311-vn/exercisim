import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class ArmstrongNumbersTest {

  private ArmstrongNumbers armstrongNumbers;

  @BeforeEach
  public void setup() {
    armstrongNumbers = new ArmstrongNumbers();
  }

  @Test
  @DisplayName("Zero is an Armstrong number")
  public void zeroIsArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(0)).isTrue();
  }

  @Test
  @DisplayName("Single-digit numbers are Armstrong numbers")
  public void singleDigitsAreArmstrongNumbers() {
    assertThat(armstrongNumbers.isArmstrongNumber(5)).isTrue();
  }

  @Test
  @DisplayName("There are no two-digit Armstrong numbers")
  public void noTwoDigitArmstrongNumbers() {
    assertThat(armstrongNumbers.isArmstrongNumber(10)).isFalse();
  }

  @Test
  @DisplayName("Three-digit number that is an Armstrong number")
  public void threeDigitNumberIsArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(153)).isTrue();
  }

  @Test
  @DisplayName("Three-digit number that is not an Armstrong number")
  public void threeDigitNumberIsNotArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(100)).isFalse();
  }

  @Test
  @DisplayName("Four-digit number that is an Armstrong number")
  public void fourDigitNumberIsArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(9474)).isTrue();
  }

  @Test
  @DisplayName("Four-digit number that is not an Armstrong number")
  public void fourDigitNumberIsNotArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(9475)).isFalse();
  }

  @Test
  @DisplayName("Seven-digit number that is an Armstrong number")
  public void sevenDigitNumberIsArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(9926315)).isTrue();
  }

  @Test
  @DisplayName("Seven-digit number that is not an Armstrong number")
  public void sevenDigitNumberIsNotArmstrongNumber() {
    assertThat(armstrongNumbers.isArmstrongNumber(9926314)).isFalse();
  }
}
