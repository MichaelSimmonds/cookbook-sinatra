require "csv"
require_relative "recipe"

class Cookbook
  attr_reader :cookbook
  def initialize(csv_file_path)
    @cookbook = []
    @csv_file_path = csv_file_path
    read_from_csv
  end

  # @cookbook.all
  def all
    read_from_csv
    return @cookbook
  end

  def add_recipe(recipe)
    # adds recipe to cookbook and re-write csv
    # Recipe.new(name, description)
    @cookbook << recipe
    write_to_csv
  end

  def remove_recipe(recipe_id)
    # TODO: remove recipe from repo and re-write csvend
    @cookbook.delete_at(recipe_id)
    write_to_csv
  end

  def mark_completed(index)
    @cookbook[index].mark_completed
    write_to_csv
    # completed_recipe = @cookbook[index].@complete
    # completed_recipe = true
  end



  private

  def write_to_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @cookbook.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.complete, recipe.difficulty]
      end
    end
  end

  def read_from_csv
    @cookbook = []
    CSV.foreach(@csv_file_path) do |row|
      @cookbook << Recipe.new(row[0], row[1], row[2], row[3], row[4]) # row ["name", "description"]
    end
  end
end
