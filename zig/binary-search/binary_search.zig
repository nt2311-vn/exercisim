// Take a look at the tests, you might have to change the function arguments

pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    var l: usize = 0;
    var r: usize = items.len;

    while (l < r) {
        const m = l + (r - l) / 2;
        if (items[m] > target) {
            r = m;
        } else if (items[m] < target) {
            l = m + 1;
        } else {
            return m;
        }
    }

    return null;
}
