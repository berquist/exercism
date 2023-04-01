pub fn is_leap_year(year: u64) -> bool {
    let by_four = year % 4 == 0;
    let by_hundred = year % 100 == 0;
    let by_four_hundred = year % 400 == 0;
    (by_four && !by_hundred) || (by_four && by_hundred && by_four_hundred)
}
