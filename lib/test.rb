# require "pp"
# require_relative "cookbook"
# require_relative "recipe"
# require_relative "controller"
#
# #
# # ## Recipe class testing
# # recipe1 = Recipe.new("Chips", "english as fuck")
# # recipe2 = Recipe.new("Pie", "tasty as fuck with peas")
# #
# # # p recipe1
# #
# # #cookbook testing
# # test_cookbook = Cookbook.new
# # test_cookbook.add_recipe(recipe1)
# # test_cookbook.add_recipe(recipe2)
# # # p test_cookbook.cookbook_arr
# # # test_cookbook.add_cookbook_to_csv
# # pp test_cookbook
# # test_cookbook.remove_recipe(0)
# # puts "*" *80
# # pp test_cookbook
# # # p test_cookbook.open_csv
# #
# # # test_cookbook.add_recipe(recipe1)
# # # test_cookbook.add_recipe(recipe2)
# # # p test_cookbook
# cookbook = Cookbook.new("recipes.csv")
# # p  cookbook.all
# controller = Controller.new(cookbook)
#
# recipe1 = controller.create("recName", "resdesc")
#  p controller.list
