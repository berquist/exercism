const MAX_NUM_CARS_PRODUCED: u32 = 221;

fn success_pct(speed: u8) -> f64 {
    if speed == 0 {
        return 0.0;
    } else if speed <= 4 {
        return 1.0;
    } else if speed <= 8 {
        return 0.9;
    } else if speed <= 10 {
        return 0.77;
    } else {
        unimplemented!();
    }
}

pub fn production_rate_per_hour(speed: u8) -> f64 {
    f64::from(speed) * success_pct(speed) * f64::from(MAX_NUM_CARS_PRODUCED)
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    (production_rate_per_hour(speed) / 60.0) as u32
}
