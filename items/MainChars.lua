SMODS.Atlas {
  key = "MainChars",
  path = "MainChars.png",
  px = 71,
  py = 95
}

SMODS.Joker {
    key = "finn",
    pos = { x = 0, y = 0 },
    rarity = 1,
	atlas = 'MainChars',
    blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    cost = 4,
    config = { extra = { mult = 7, alignment_lawchaos = "neutral", alignment_goodevil = "good" }, },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "neutral_good" }
		return {vars = {card.ability.extra.mult, card.ability.extra.mult * #find_alignment_goodevil("good")}}
	end,
    calculate = function(self, card, context)
		if context.cardarea == G.jokers and context.scoring_hand then
		  if context.joker_main then
			local count = #find_alignment_goodevil("good")
			if count > 0 then
			  return {
				message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult * count}}, 
				colour = G.C.MULT,
				mult_mod = card.ability.extra.mult * count
			  }
			end
		  end
		end
	end,
}

SMODS.Joker {
    key = "jake",
    pos = { x = 1, y = 0 },
    rarity = 1,
	atlas = 'MainChars',
    blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    cost = 4,
    config = { extra = { chips = 30, change = 10, alignment_lawchaos = "neutral", alignment_goodevil = "good" }, },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "neutral_good" }
		return { vars = { card.ability.extra.chips, card.ability.extra.change } }
	end,
    calculate = function(self, card, context)
		if context.before and next(context.poker_hands['Flush']) then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.change
			return {
				message = 'Upgraded!',
				colour = G.C.RED
				}    
		end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}

SMODS.Joker {
    key = "bubblegum",
    pos = { x = 2, y = 0 },
    rarity = 1,
	atlas = 'MainChars',
    blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    cost = 2,
    config = { extra = { seal = "Candy", alignment_lawchaos = "lawful", alignment_goodevil = "neutral" }, },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "lawful_neutral" }
        return { vars = { card.ability.extra.seal } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and context.scoring_hand and context.full_hand and #context.full_hand == 1 and context.scoring_hand[1]:is_face() then
			context.scoring_hand[1]:set_seal("attro_" .. card.ability.extra.seal)
			context.full_hand[1]:juice_up()
			return true
        end
    end
}

SMODS.Joker {
    key = "lady",
    pos = { x = 3, y = 0 },
    rarity = 1,
	atlas = 'MainChars',
    blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    cost = 4,
    config = { extra = { chips = 30, change = 10, alignment_lawchaos = "neutral", alignment_goodevil = "good" }, },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "neutral_good" }
		return { vars = { card.ability.extra.chips, card.ability.extra.change } }
	end,
    calculate = function(self, card, context)
		if context.before and next(context.poker_hands['Straight']) then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.change
			return {
				message = 'Upgraded!',
				colour = G.C.RED
				}    
		end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}

SMODS.Joker {
    key = "marceline",
    pos = { x = 0, y = 1 },
    rarity = 1,
	atlas = 'MainChars',
    blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    cost = 4,
    config = { extra = { Xmult_gain = 0.05, Xmult = 1, suit = "Hearts", alignment_lawchaos = "chaotic", alignment_goodevil = "good" }, },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "chaotic_good" }
		return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult, card.ability.extra.suit } }
	end,
    calculate = function(self, card, context)
        if context.discard and context.other_card:is_suit(card.ability.extra.suit) and not context.other_card.debuff then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end
		if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end
}

SMODS.Joker {
    key = "iceking",
    pos = { x = 1, y = 1 },
    rarity = 1,
	atlas = 'MainChars',
    blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    cost = 4,
    config = { extra = { mult = 8, alignment_lawchaos = "chaotic", alignment_goodevil = "neutral" }, },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { set = "Other", key = "chaotic_neutral" }
		return { vars = { card.ability.extra.mult } }
	end,
    calculate = function(self, card, context)
		count = 0
		if context.cardarea == G.jokers and context.scoring_hand then
			if context.joker_main then
				for k, c in ipairs(context.scoring_hand) do
					if c.ability.name == 'Glass Card' then
						count = count + 1
					end
				end 
				return {
					mult = card.ability.extra.mult * count
				}
			end
		end
    end
}