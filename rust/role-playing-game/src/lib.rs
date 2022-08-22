pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health == 0 {
            Some(Player {
                health: 100,
                mana: if self.level >= 10 { Some(100) } else { None },
                ..*self
            })
        } else {
            None
        }
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        if let Some(mana) = self.mana {
            if mana_cost <= mana {
                self.mana = Some(mana - mana_cost);
                2 * mana_cost
            } else {
                0
            }
        } else {
            self.health = self.health.saturating_sub(mana_cost);
            0
        }
    }
}
