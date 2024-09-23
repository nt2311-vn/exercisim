const std = @import("std");
const math = @import("std").math;
pub fn isArmstrongNumber(num: u128) bool {
    var digit: u128 = 0;
    var remain_num: u128 = num;
    while (remain_num > 0) {
        digit += 1;
        remain_num /= 10;
    }

    var sum: u128 = 0;
    remain_num = num;
    while (remain_num > 0) {
        sum += math.pow(u128, remain_num % 10, digit);
        remain_num /= 10;
    }

    return sum == num;
}
