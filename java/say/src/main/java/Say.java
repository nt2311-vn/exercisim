import static java.util.Map.entry;
import static java.util.Map.ofEntries;

import java.util.NavigableMap;
import java.util.Optional;
import java.util.TreeMap;

public class Say {

  private static final long MAX_NUMBER = 999_999_999_999L;
  private static final String EMPTY = "";
  private static final String SPACE = " ";
  private static final String HYPHEN = "-";

  private static final NavigableMap<Long, String> NUMBERS =
      new TreeMap<>(
          ofEntries(
              entry(0L, "zero"),
              entry(1L, "one"),
              entry(2L, "two"),
              entry(3L, "three"),
              entry(4L, "four"),
              entry(5L, "five"),
              entry(6L, "six"),
              entry(7L, "seven"),
              entry(8L, "eight"),
              entry(9L, "nine"),
              entry(10L, "ten"),
              entry(11L, "eleven"),
              entry(12L, "twelve"),
              entry(13L, "thirteen"),
              entry(14L, "fourteen"),
              entry(15L, "fifteen"),
              entry(16L, "sixteen"),
              entry(17L, "seventeen"),
              entry(18L, "eighteen"),
              entry(19L, "nineteen"),
              entry(20L, "twenty"),
              entry(30L, "thirty"),
              entry(40L, "forty"),
              entry(50L, "fifty"),
              entry(60L, "sixty"),
              entry(70L, "seventy"),
              entry(80L, "eighty"),
              entry(90L, "ninety"),
              entry(100L, "hundred"),
              entry(1000L, "thousand"),
              entry(1000_000L, "million"),
              entry(1000_000_000L, "billion")));

  public String say(final long number) {

    if (number < 0 || number > MAX_NUMBER) {
      throw new IllegalArgumentException();
    }

    if (number < 100) {
      return Optional.ofNullable(NUMBERS.get(number))
          .orElseGet(() -> NUMBERS.floorEntry(number).getValue() + HYPHEN + this.say(number % 10));
    }

    return this.say(number / NUMBERS.floorKey(number))
        + SPACE
        + Optional.ofNullable(NUMBERS.get(number))
            .orElseGet(
                () ->
                    NUMBERS.floorEntry(number).getValue()
                        + (number % NUMBERS.floorKey(number) > 0
                            ? SPACE + this.say(number % NUMBERS.floorKey(number))
                            : EMPTY));
  }
}
