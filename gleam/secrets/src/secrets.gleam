import gleam/int

pub fn secret_add(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) { secret + x }
}

pub fn secret_subtract(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) { x - secret }
}

pub fn secret_multiply(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) { x * secret }
}

pub fn secret_divide(secret: Int) -> fn(Int) -> Int {
  fn(x: Int) {
    case int.floor_divide(x, secret) {
      Ok(val) -> val
      Error(_) -> 0
    }
  }
}

pub fn secret_combine(
  secret_function1: fn(Int) -> Int,
  secret_function2: fn(Int) -> Int,
) -> fn(Int) -> Int {
  fn(x: Int) { secret_function2(secret_function1(x)) }
}
