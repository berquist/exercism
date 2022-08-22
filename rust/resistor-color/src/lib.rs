use enum_iterator::{all, Sequence};
use int_enum::IntEnum;

#[repr(u32)]
#[derive(Copy, Clone, Debug, Eq, PartialEq, IntEnum, Sequence)]
pub enum ResistorColor {
    Black = 0,
    Blue = 6,
    Brown = 1,
    Green = 5,
    Grey = 8,
    Orange = 3,
    Red = 2,
    Violet = 7,
    White = 9,
    Yellow = 4,
}

pub fn color_to_value(color: ResistorColor) -> u32 {
    color.int_value()
}

pub fn value_to_color_string(value: u32) -> String {
    let rc = ResistorColor::from_int(value);
    match rc {
        Ok(ResistorColor::Black) => String::from("Black"),
        Ok(ResistorColor::Blue) => String::from("Blue"),
        Ok(ResistorColor::Brown) => String::from("Brown"),
        Ok(ResistorColor::Green) => String::from("Green"),
        Ok(ResistorColor::Grey) => String::from("Grey"),
        Ok(ResistorColor::Orange) => String::from("Orange"),
        Ok(ResistorColor::Red) => String::from("Red"),
        Ok(ResistorColor::Violet) => String::from("Violet"),
        Ok(ResistorColor::White) => String::from("White"),
        Ok(ResistorColor::Yellow) => String::from("Yellow"),
        Err(_) => String::from("value out of range"),
    }
}

pub fn colors() -> Vec<ResistorColor> {
    let mut v: Vec<_> = all::<ResistorColor>().collect();
    v.sort_by(|a, b| a.int_value().partial_cmp(&b.int_value()).unwrap());
    v
}
