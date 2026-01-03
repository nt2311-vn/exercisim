import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gigasecond {
  private LocalDateTime moment;
  private final long GIGA_SECONDS = 1_000_000_000;

  public Gigasecond(LocalDate moment) {
    this.moment = moment.atStartOfDay();
  }

  public Gigasecond(LocalDateTime moment) {
    this.moment = moment;
  }

  public LocalDateTime getDateTime() {
    return this.moment.plusSeconds(GIGA_SECONDS);
  }
}
