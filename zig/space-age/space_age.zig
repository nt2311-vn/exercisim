pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const earth_years: f64 = @as(f64, @floatFromInt(seconds)) / 31_557_000.0;
        switch (self) {
            Planet.mercury => return earth_years / 0.2408467,
            Planet.venus => return earth_years / 0.61519726,
            Planet.earth => return earth_years / 1.0,
            Planet.mars => return earth_years / 1.8808158,
            Planet.jupiter => return earth_years / 11.862615,
            Planet.saturn => return earth_years / 29.447498,
            Planet.uranus => return earth_years / 84.016846,
            Planet.neptune => return earth_years / 164.79132,
        }
    }
};
