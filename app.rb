require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative 'lib/cookbook'    # You need to create this file!
require_relative 'lib/recipe'
require_relative "lib/recipe_scraper"


csv_file   = File.join(__dir__, '/lib/recipes.csv')
COOKBOOK   = Cookbook.new(csv_file)
RECIPE_SCRAPER = Recipe_scraper.new

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end


get '/' do
  @recipes = COOKBOOK.all
  erb :index
end

post '/add_confirmation' do
  @recipe_name = params[:recipe_name]
  @recipe_desc = params[:recipe_desc]
  new_recipe = Recipe.new(@recipe_name, @recipe_desc, "9hrs", "hard")
  COOKBOOK.add_recipe(new_recipe)
  erb :add_confirmation, :locals => {'recipe_name' => @recipe_name, 'recipe_desc' => @recipe_desc}
end

post '/remove_confirmation' do
  @recipe_index = params[:recipe_index].to_i - 1
  COOKBOOK.remove_recipe(@recipe_index)
  @recipe_index += 1
  erb :remove_confirmation, :locals => {'recipe_index' => @recipe_index}
end

post '/find_recipe' do
  @search_name = params[:search_name]
  @search_difficulty = params[:search_difficulty]
  @results = RECIPE_SCRAPER.scrape_site(@search_name, @search_difficulty)
  RESULTS = @results
  erb :find_recipe, :locals => {'search_name' => @search_name, 'search_difficulty' => @search_difficulty, 'results' => @results}
end

post '/add_search_confirmation' do
  @search_recipe_index = params[:search_recipe_index].to_i
  @recipe_name = RESULTS[@search_recipe_index][0]
  @recipe_desc = RESULTS[@search_recipe_index][1]
  new_recipe = Recipe.new(@recipe_name, @recipe_desc, "9hrs", "hard")
  COOKBOOK.add_recipe(new_recipe)
  erb :add_search_confirmation, :locals => {'recipe_name' => @recipe_name, 'recipe_desc' => @recipe_desc}

end
