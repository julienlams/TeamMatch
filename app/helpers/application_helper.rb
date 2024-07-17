module ApplicationHelper
  def formatted_cost(cost)
    number_to_currency(cost, unit: "€", precision: (cost == cost.to_i ? 0 : 2), format: "%n %u")
  end

  def card_class(sport_name)
    sport_name = sport_name.to_s.downcase
    case sport_name
    when 'tennis'
      "barbarian"
    when 'padel'
      "archer"
    when 'badminton'
      "bad"
    when 'ping-pong'
      "goblin"
    else
      ""
    end
  end

  def image_class(sport_name)
    sport_name = sport_name.to_s.downcase
    case sport_name
    when 'tennis'
      "clash-card__image--barbarian"
    when 'padel'
      "clash-card__image--archer"
    when 'badminton'
      "clash-card__image--bad"
    when 'ping-pong'
      "clash-card__image--goblin"
    else
      ""
    end
  end

  def level_class(sport_name)
    sport_name = sport_name.to_s.downcase
    case sport_name
    when 'tennis'
      "clash-card__level--barbarian"
    when 'padel'
      "clash-card__level--archer"
    when 'badminton'
      "clash-card__level--bad"
    when 'ping-pong'
      "clash-card__level--goblin"
    else
      ""
    end
  end

  def stats_class(sport_name)
    sport_name = sport_name.to_s.downcase
    case sport_name
    when 'tennis'
      "clash-card__unit-stats--barbarian"
    when 'padel'
      "clash-card__unit-stats--archer"
    when 'badminton'
      "clash-card__unit-stats--bad"
    when 'ping-pong'
      "clash-card__unit-stats--goblin"
    else
      ""
    end
  end
end
