class View
  def display_all(recipe)
    if recipe.empty?
      puts "You ain't made no recipies fool"
    else
      puts "You should be ashamed - all you can cook is shown below"
      puts "*" * 40
      recipe.each_with_index do |recipe_obj, index|
        puts "#{index + 1}. #{recipe_obj.name} => Wanna make it? just:-"
        puts "#{recipe_obj.description} It takes #{recipe_obj.time} and its completion status is #{recipe_obj.complete} and difficulty is #{recipe_obj.difficulty}"
      end
    end
  end

  def ask_recipe_id
    puts "Man, what you gonna bin-off?"
    answer = gets.chomp.to_i
    answer -= 1
    return answer
  end

  def ask_name
    puts "Wha da name of your banging scran?"
    return gets.chomp
  end

  def ask_description
    puts "Rude-boy that sounds Tayz-T - how u make it?"
    return gets.chomp
  end

  def ask_search_term
    puts "What ingredient would you like to search the recipes for"
    return gets.chomp
  end

  def ask_difficulty
    puts "what difficulty would you like 1 (easy)-4(difficult)-press enter for all difficulty levels"
    return gets.chomp
  end

  def list_scraped_recipes(search_array)
    search_array.each_with_index do |recipe_array, index|
      puts "#{index+1} >>> #{recipe_array[0]} It takes #{recipe_array[2]} difficulty id #{recipe_array[3]}"
    end
    puts "What would you like to choose"
    answer = gets.chomp.to_i - 1
    return search_array[answer]
  end

  def which_completed
    puts "Which recipe have you completed?"
    temp_index = gets.chomp.to_i
    temp_index = temp_index - 1
  end


end
