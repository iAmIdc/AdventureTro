SMODS.Atlas {
  key = "modicon",
  path = "AdventureTroIcon.png",
  px = 34,
  py = 34
}

local allFolders = { "none", "items" }

local allFiles = { ["none"] = {}, ["items"] = { "Functions", "MainChars", "Decks", "Seals" } }

for i = 1, #allFolders do
  if allFolders[i] == "none" then
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFiles[allFolders[i]][j] .. ".lua"))()
    end
  else
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFolders[i] .. "/" .. allFiles[allFolders[i]][j] .. ".lua"))()
    end
  end
end

G.C.ATTRO = {}

G.C.ATTRO.MISC_COLOURS = {
  NEUTRAL_GOOD = HEX("78C48A"),
  CHAOTIC_GOOD = HEX("BE85CB"),
  LAWFUL_NEUTRAL = HEX("7ED9DA"),
}

local ref = Game.main_menu
function Game:main_menu(change_context)
  for k, v in pairs(G.P_CENTERS) do
    if v.config and v.config.extra and type(v.config.extra) == "table" and v.config.extra.alignment_lawchaos == "neutral" and v.config.extra.alignment_goodevil == "good" then
      v.set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('neutral_good_badge'), G.C.ATTRO.MISC_COLOURS.NEUTRAL_GOOD,
          G.C.WHITE, 1)
      end
    end
	if v.config and v.config.extra and type(v.config.extra) == "table" and v.config.extra.alignment_lawchaos == "chaotic" and v.config.extra.alignment_goodevil == "good" then
      v.set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('chaotic_good_badge'), G.C.ATTRO.MISC_COLOURS.CHAOTIC_GOOD,
          G.C.WHITE, 1)
      end
    end
	if v.config and v.config.extra and type(v.config.extra) == "table" and v.config.extra.alignment_lawchaos == "lawful" and v.config.extra.alignment_goodevil == "neutral" then
      v.set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('lawful_neutral_badge'), G.C.ATTRO.MISC_COLOURS.LAWFUL_NEUTRAL,
          G.C.WHITE, 1)
      end
    end
  end
  ref(self, change_context)
end