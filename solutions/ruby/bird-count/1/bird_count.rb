class BirdCount
  def self.last_week
    return [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  def yesterday
    return @birds_per_day[-2]
  end

  def total
    return @birds_per_day.sum
  end

  def busy_days
    res = 0
    for i in @birds_per_day
      if i>=5
          res += 1
      end
    end
    return res
          
  end

  def day_without_birds?
    @birds_per_day.any?{ |number| number == 0 } 
  end
end
