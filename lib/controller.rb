require_relative "recipe"
require_relative "controller"
require_relative "view"
require_relative "recipe_scraper"



class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @recipe_scraper = Recipe_scraper.new
  end

  def list
    # 1. Ask the repo for all the tasks
    recipes = @cookbook.all
    # 2. Ask the view to display all the tasks
    @view.display_all(recipes)
  end

  def create
    # creat a new recipe
    name = @view.ask_name
    description = @view.ask_description
    new_recipe = Recipe.new(name, description, time, difficulty)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # Ask view for recipe_id
    recipe_id = @view.ask_recipe_id
    # Destroy dat recipe
    @cookbook.remove_recipe(recipe_id)
  end

  def find_recipe
    # ask view to ask for search term
    ingredient_choice = @view.ask_search_term
    # ask view for difficulty
    difficulty_choice = @view.ask_difficulty
    ##ask scraper to scrape based on term
    results = @recipe_scraper.scrape_site(ingredient_choice, difficulty_choice)
    #ask view to display list and return the chosen array
    recipe = @view.list_scraped_recipes(results)
    #turn array into recipe object
    new_recipe = Recipe.new(recipe[0],recipe[1],recipe[2],recipe[3],)
    # push object to cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def find_by_difficulty
    #ask view for difficulty (list difficulties and select)
    # ask view for ingredient
    # find recipe using new search string
    # http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=ham&dif=2&dif=3
  end

  def mark_completed
    #'ask user which he has completed'
    completed_index = @view.which_completed
    #add completed tag to the list
    @cookbook.mark_completed(completed_index)

  end


end
