const math = @import("std").math;
pub const Coordinate = struct {
    x_coord: f32,
    y_coord: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{ .x_coord = x_coord, .y_coord = y_coord };
    }
    pub fn score(self: Coordinate) usize {
        const rad = math.sqrt(self.x_coord * self.x_coord + self.y_coord * self.y_coord);

        if (rad <= 1) return 10;
        if (rad <= 5) return 5;
        if (rad <= 10) return 1;
        return 0;
    }
};
