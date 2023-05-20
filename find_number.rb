
class FindNumber

  MAXIMAL_ITERATION = 10

  def initialize(number_goal:, first_number:)
    @number_goal = number_goal
    @first_number = first_number
    @tries= {}
  end

  def find
    previous_try = @first_number
    try = previous_try/2
    iteration = 0

    until is_goal?(try) do
      diff = diff(previous_try,try)
      previous_try = try
      iteration += 1

      break if iteration == MAXIMAL_ITERATION
      
      if is_plus?(try)
        try = try + diff
      else
        try = try - diff
      end
      @tries[iteration:] = {iteration:, try:, diff:}
    end

    @tries[:number_of_tries] = @tries.count
    @tries

  end

  def diff(previous_try,try)
    return 1 if (previous_try - try).abs == 1
    (previous_try - try).abs/2
  end


  def is_plus?(number)
    @number_goal > number
  end

  def is_goal?(number)
    @number_goal == number
  end
end

#### Call

number_goal = 88
first_number = 100

FindNumber
  .new(number_goal:, first_number:)
  .find
  .each do |try|
    p try
  end