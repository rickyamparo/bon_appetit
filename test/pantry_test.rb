require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
  end

  def test_it_exists_with_empty_stock
    empty_hash = {}

    assert_instance_of Pantry, @pantry
    assert_equal empty_hash, @pantry.stock
  end

  def test_it_can_check_stock
    assert_equal 0, @pantry.stock_check("Cheese")
  end

  def test_it_can_restock
    @pantry.restock("Cheese", 10)

    assert_equal 10, @pantry.stock_check("Cheese")

    @pantry.restock("Cheese", 20)

    assert_equal 30, @pantry.stock_check("Cheese")
  end

  def test_it_can_convert_units
    r = Recipe.new("Spicy Cheese Pizza")

    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)

    cayenne_converted = {quantity: 25, units: "Milli-Units"}
    cheese_converted  = {quantity: 75, units: "Universal Units"}
    flour_converted   = {quantity: 5, units: "Centi-Units"}

    assert_instance_of Hash, @pantry.convert_units(r)
    assert_equal cayenne_converted, r.ingredients["Cayenne Pepper"]
    assert_equal cheese_converted, r.ingredients["Cheese"]
    assert_equal flour_converted, r.ingredients["Flour"]
  end

end
