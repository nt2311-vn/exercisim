// pub fn isLeapYear(year: u32) bool {
//     if (year % 4 == 0) {
//         if (year % 100 == 0) {
//             if (year % 400 == 0) {
//                 return true;
//             }
//             return false;
//         }
//         return true;
//     }
//     return false;
// }

pub fn isLeapYear(year: u32) bool {
    if (year % 4 == 0) {
        if (year % 100 == 0) {
            return if (year % 400 == 0) true else false;
        } else {
            return true;
        }
    }

    return false;
}
