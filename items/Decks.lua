SMODS.Atlas {
  key = "Decks",
  path = "Decks.png",
  px = 71,
  py = 95
}

SMODS.Back {
  key = 'hero',
  atlas = 'Decks',
  pos = { x = 0, y = 0 },
  config = { extra = { joker_slots = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = {  } }
  end,
  apply = function(self, back)
    G.E_MANAGER:add_event(Event({
      func = function()
        if G.jokers then
          local candidates = {}
          for i, v in pairs(G.P_CENTER_POOLS.Joker) do
            if v.config and v.config.extra and type(v.config.extra) == "table" and v.config.extra.alignment_goodevil == "good" then
              candidates[#candidates+1] = v.key
            end
          end
          local card_to_create = pseudorandom_element(candidates, pseudoseed("randomherojoker"))
          local card = SMODS.create_card({set="Joker", area=G.jokers, key=card_to_create})
          card:add_to_deck()
          G.jokers:emplace(card)
          return true
        end
      end
    }))
  end
}