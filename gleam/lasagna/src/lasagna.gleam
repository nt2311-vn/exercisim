// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() -> Int {
  40
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(time_in: Int) -> Int {
  40 - time_in
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(layers: Int) -> Int {
  2 * layers
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(layers: Int, time_in: Int) -> Int {
  time_in + preparation_time_in_minutes(layers)
}

// Please define the alarm function
pub fn alarm() -> String {
  "Ding!"
}
