class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    res = @speed * 221
    if @speed >=5 && @speed <=8
        res *= 0.9
    elsif @speed == 9
      res *= 0.8
    elsif @speed == 10
        res *= 0.77
    end
    return res
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
