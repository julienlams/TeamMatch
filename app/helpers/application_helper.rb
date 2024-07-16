module ApplicationHelper
  def formatted_cost(cost)
    number_to_currency(cost, unit: "€", precision: (cost == cost.to_i ? 0 : 2), format: "%n %u")
  end

  def card_class(index)
    case index
    when 0
      "barbarian"
    when 1
      "archer"
    when 2
      "goblin"
    else
      ""
    end
  end

  def image_class(index)
    case index
    when 0
      "clash-card__image--barbarian"
    when 1
      "clash-card__image--archer"
    when 2
      "clash-card__image--goblin"
    else
      ""
    end
  end

  def level_class(index)
    case index
    when 0
      "clash-card__level--barbarian"
    when 1
      "clash-card__level--archer"
    when 2
      "clash-card__level--goblin"
    else
      ""
    end
  end

  def stats_class(index)
    case index
    when 0
      "clash-card__unit-stats--barbarian"
    when 1
      "clash-card__unit-stats--archer"
    when 2
      "clash-card__unit-stats--goblin"
    else
      ""
    end
  end
end
