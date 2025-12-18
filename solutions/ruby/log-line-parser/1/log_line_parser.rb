class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    return @line.split(':', 2)[1].strip
    
  end

  def log_level
    return @line.split(':', 2)[0].delete('[]').downcase
  end

  def reformat
    (@line.split(':', 2)[1].strip)+" (#{log_level})"
  end
end
