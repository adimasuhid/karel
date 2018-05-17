class Karel
  STEP = 1
  DIRECTIONS = {
    E: 0,
    N: 90,
    W: 180,
    S: 270
  }
  DIRECTION_ANGLE = 90
  FULL_CIRCLE_ANGLE = 360

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def current_location
    "(#{x},#{y}) #{direction}" end

  def move
    case direction
    when 'N' 
      self.y = y - STEP
    when 'S'
      self.y = y + STEP
    when 'W'
      self.x = x - STEP
    when 'E'
      self.x = x + STEP
    end
  end

  def left
    turn(DIRECTION_ANGLE)
  end

  def right
    turn(-DIRECTION_ANGLE)
  end

  def follow(sequence)
    sequence.split('').each { |command| run(command) }
  end

  private

  attr_accessor :x, :y, :direction

  def turn(angle)
    new_direction = DIRECTIONS[direction.to_sym] + angle
    new_direction = new_direction % FULL_CIRCLE_ANGLE

    self.direction = DIRECTIONS.select { |k,v| v == new_direction }.keys.first
  end

  def run(command)
    case command
    when 'M' then move
    when 'L' then left
    when 'R' then right
    end
  end
end
