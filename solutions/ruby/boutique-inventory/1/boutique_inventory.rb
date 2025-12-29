class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map{|idd|idd[:name]}.sort
  end

  def cheap
    @items.select{|idd|idd[:price]<30.00}
  end

  def out_of_stock
    @items.select{|idd|idd[:quantity_by_size]=={}}
    
  end

  def stock_for_item(name)
    item = @items.find { |item| item[:name] == name }
    item ? item[:quantity_by_size] : {}

    
  end

  def total_stock
    @items.sum do |item|
      item[:quantity_by_size].values.sum
    end
  end

  private
  attr_reader :items
end
