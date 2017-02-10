require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_item
  attr_reader :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = Array.new
  end

  def add_item(title, price, quantity=1)
    @price = price
    @total += price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if discount != 0
      @total = @total * (100-@discount)/100.to_f
      return "After the discount, the total comes to $#{total.round(0)}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @price
  end
end
