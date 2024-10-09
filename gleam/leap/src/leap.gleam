import gleam/int

pub fn is_leap_year(year: Int) -> Bool {
  let rmain_four = int.remainder(year, 4)
  let rmain_hundred = int.remainder(year, 100)
  let rmain_fourhundred = int.remainder(year, 400)

  case rmain_four {
    Error(Nil) -> False
    Ok(0) -> {
      case rmain_hundred {
        Error(Nil) -> False
        Ok(0) -> {
          case rmain_fourhundred {
            Ok(0) -> True
            _ -> False
          }
        }
        _ -> True
      }
    }
    _ -> False
  }
}
