module Blackjack
  CARD_VALUES = {
    "two" => 2, "three" => 3, "four" => 4, "five" => 5,
    "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9,
    "ten" => 10, "jack" => 10, "queen" => 10, "king" => 10,
    "ace" => 11
  }
  def self.parse_card(card)
    case card
    when "ace" then 11
    when "two" then 2
    when "four" then 4
    when "five" then 5
    when "three" then 3
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten","jack","queen","king" then 10
    else 0
    end  
  end

  def self.card_range(card1, card2)
    a = self.parse_card(card1)
    b = self.parse_card(card2)
    c = a+b
    case
    when (4..11).include?(c) then "low"
    when (12..16).include?(c) then"mid"
    when (17..20).include?(c) then "high"
  else 
    "blackjack"
  end
    
  end

  def self.first_turn(card1, card2, dealer_card)
    # Rule 1: Pair of aces → Split
    if card1 == "ace" && card2 == "ace"
      return "P"
    end

    player_sum = CARD_VALUES[card1] + CARD_VALUES[card2]
    dealer_value = CARD_VALUES[dealer_card]

    # Rule 2: Blackjack (21)
    if player_sum == 21
      if ["ace", "ten", "jack", "queen", "king"].include?(dealer_card)
        return "S"
      else
        return "W"
      end
    end

    # Rule 3: Sum 17–20 → Stand
    if player_sum >= 17 && player_sum <= 20
      return "S"
    end

    # Rule 4: Sum 12–16
    if player_sum >= 12 && player_sum <= 16
      return dealer_value >= 7 ? "H" : "S"
    end

    # Rule 5: Sum 11 or lower → Hit
    "H"
  end
end
