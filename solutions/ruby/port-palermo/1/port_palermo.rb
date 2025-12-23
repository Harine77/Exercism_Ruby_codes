module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0,4].upcase.to_sym    
  end

  def self.get_terminal(ship_identifier)
    a = ship_identifier.to_s[0,3]    
    if a == "OIL" or a == "GAS"
      return "A".to_sym
    else
      return "B".to_sym
    end  
    
  end
end
