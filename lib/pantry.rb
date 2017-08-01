class Pantry

  attr_reader :stock, :cookbook

  def initialize
    @stock = {}
    @cookbook = []
  end

  def stock_check(item)
    if @stock[item] == nil
      return 0
    else
      @stock[item]
    end
  end

  def restock(item, quantity)
    if @stock[item] == nil
      @stock[item] = 0
    end
    @stock[item] = quantity + @stock[item]
  end

  def convert_units(recipe)
    recipe.ingredients.each_pair do |key, value|
      recipe.ingredients[key] = conversion(value)
    end
  end

  def conversion(quantity)
    if quantity < 1
      quantity *= 1000
      {quantity: quantity, units: "Milli-Units"}
    elsif quantity > 100
      quantity = quantity/100
      {quantity: quantity, units: "Centi-Units"}
    else
      {quantity: quantity, units: "Universal Units"}
    end
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  def what_can_i_make
    possible_recipes = @cookbook
    possible_recipes.map do |possibility|
      if check_if_stocked(possibility) == false
        possible_recipes.delete(possibility)
        binding.pry
      end
    end
  end

  def check_if_stocked(recipe)
    ingredients = recipe.ingredients.keys
    ingredients.each do |ingredient|
      recipe.ingredients[ingredient] < @stock[ingredient]
    end
  end

end
