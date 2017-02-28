class Recipe
  attr_reader :name, :description, :time, :complete, :difficulty
  def initialize(name, description, time, complete = false, difficulty)
    @name = name
    @description = description
    @time = time
    @complete = complete
    @difficulty = difficulty
  end


  def mark_completed
    @complete = true
  end
  # def test_p
  #   puts "name = #{@name}  desc = #{description}"
  # end
end
