// Please implement the `ComputationError.IllegalArgument` error.
pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) {
        return ComputationError.IllegalArgument;
    }

    var turn: usize = 0;
    var cur: usize = number;

    while (cur != 1) {
        turn += 1;
        if (cur % 2 == 0) {
            cur /= 2;
        } else {
            cur = 3 * cur + 1;
        }
    }

    return turn;
}
