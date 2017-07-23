class Player
  attr_reader :score, :name, :wins, :losses

  def initialize(name)
    @name = name
    @score = 0
    @wins = 0
    @losses = 0
  end

  def start_game
    @score = 0
  end

  def start_turn
    @turn_score = 0
    @turn_over = false
  end

  def record_roll(roll)
    if roll == 1
      @turn_score = 0
      @turn_over = true
    else
      @turn_score += roll
    end
  end

  def end_turn
    @score += @turn_score
  end

  def end_game
    if score >= 100
      @wins += 1
    else
      @losses += 1
    end
  end

  def roll_again?
    !@turn_over
  end
end

class CautiousPlayer < Player
  def roll_again?
    super && @turn_score < 2
  end
end

class HalfPlayer < Player
  def roll_again?
    [true, false].sample
  end
end
# best way of returning a random boolean value
# https://stackoverflow.com/questions/8012746/best-way-of-returning-a-random-boolean-value

class LuckyFivePlayer < Player
  def roll_again?
    super && @turn_score < 5
  end

class CurrentScorePlayer < Player
  def roll_again?
    super && ((@score >= 78 && @turn_score < 22) || @turn_score < 20)
  end
end
end
