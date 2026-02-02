return {
    descriptions = {
        Back = {
			b_attro_hero = {
					name = 'Hero Deck',
					text = {
						"Start with a",
						"{C:attention}Good{}-aligned Joker",
					}
            },
        },
        Joker = {
            j_attro_finn               = {
                name = 'Finn',
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "{C:attention}Good{}-aligned Joker you have",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                }  
            },
			j_attro_jake               = {
                name = 'Jake',
                text = {
                    "Gains {C:chips}+#2#{} Chips if",
                    "played hand contains a {C:attention}Flush{}",
					"{C:inactive}(Currently {C:white,X:chips}+#1#{C:inactive} Chips){}"
                }
            },
			j_attro_bubblegum               = {
                name = 'Princess Bubblegum',
                text = {
                    "If played hand is a",
                    "single {C:attention}face{} card,", 
					"give it a {C:pink}#1#{} seal",
                }
            },
			j_attro_lady               = {
                name = 'Lady Rainicorn',
                text = {
                    "Gains {C:chips}+#2#{} Chips if",
                    "played hand contains a {C:attention}Straight{}",
					"{C:inactive}(Currently {C:white,X:chips}+#1#{C:inactive} Chips){}"
                }
            },
			j_attro_marceline               = {
                name = 'Marceline',
                text = {
                    "Gains {X:mult,C:white} X#1# {} Mult per",
                    "discarded {C:hearts}#3#{}",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                }
            },
        },
        Tag = {
        },
        Other = {
            neutral_good = {
                name = 'Neutral Good',
                text = {
                    "A Joker depicting a",
                    "character who is",
                    "good in a neutral way.",
                }
            },
			chaotic_good = {
                name = 'Chaotic Good',
                text = {
                    "A Joker depicting a",
                    "character who is",
                    "good in a chaotic way.",
                }
            },
			lawful_neutral = {
                name = 'Lawful Neutral',
                text = {
                    "A Joker depicting a",
                    "character who is",
                    "neutral in a lawful way.",
                }
            }
        }
    },
    misc = {
        dictionary = {
            neutral_good_badge = "Neutral Good",
			chaotic_good_badge = "Chaotic Good",
			lawful_neutral_badge = "Lawful Neutral",
        },
        labels = {
        },
        v_dictionary = {
        }
    }
}
