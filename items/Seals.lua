SMODS.Atlas {
  key = "Enhancements",
  path = "Enhancements.png",
  px = 71,
  py = 95
}

SMODS.Seal {
  key = "Candy",
  loc_txt = {
    name = 'Candy Seal',
	label = 'Candy Seal',
    text = {
      "Each {C:hearts}#1#{} card", 
	  "adds {C:chips}+#2#{} to score",
      "while this card",
      "stays in hand",
    }
  },
  badge_colour = HEX("FF6AF9"),
  atlas = "Enhancements",
  pos = { x = 0, y = 0 },
  config = { extra = { suit = "Hearts", chips = "40" } },
  loc_vars = function(self, info_queue, center)
    return { vars = { self.config.extra.suit, self.config.extra.chips } }
  end,
  calculate = function(self, card, context)
    if context.main_scoring and context.cardarea == G.hand then
		return {
            chips = ((function() local count = 0; for _, card in ipairs(G.play and G.play.cards or {}) do if card.base.suit == self.config.extra.suit then count = count + 1 end end; return count end)()) * self.config.extra.chips
            }
	end
  end,
  in_pool = function() return false end
}