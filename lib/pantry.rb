class Pantry

  attr_reader :stock

  def initialize
    @stock = {}
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

  def apply_conversion(ingredients)

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

end