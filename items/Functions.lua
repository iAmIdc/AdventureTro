find_alignment_lawchaos = function(target_alignment, exclude_card, exclude_name)
  local found = {}
  if G.jokers and G.jokers.cards then
    for k, v in pairs(G.jokers.cards) do
      if is_alignment_lawchaos(v, target_alignment) and v ~= exclude_card and v.ability.name ~= exclude_name then
        table.insert(found, v)
      end
    end
  end
  return found
end

is_alignment_lawchaos = function(card, target_alignment)
  return card and get_alignment_lawchaos(card) == target_alignment
end

get_alignment_lawchaos = function(card)
  if card.ability and type(card.ability.extra) == "table" and card.ability.extra.alignment_lawchaos then
    return card.ability.extra.alignment_lawchaos
  end
  return nil
end

find_alignment_goodevil = function(target_alignment, exclude_card, exclude_name)
  local found = {}
  if G.jokers and G.jokers.cards then
    for k, v in pairs(G.jokers.cards) do
      if is_alignment_goodevil(v, target_alignment) and v ~= exclude_card and v.ability.name ~= exclude_name then
        table.insert(found, v)
      end
    end
  end
  return found
end

is_alignment_goodevil = function(card, target_alignment)
  return card and get_alignment_goodevil(card) == target_alignment
end

get_alignment_goodevil = function(card)
  if card.ability and type(card.ability.extra) == "table" and card.ability.extra.alignment_goodevil then
    return card.ability.extra.alignment_goodevil
  end
  return nil
end
