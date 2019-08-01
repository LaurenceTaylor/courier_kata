class Order
  SPEEDY_MULTIPLIER = 2

  def initialize
    @items = []
    @speedy_shipping = false
  end

  def add(item)
    @items << item
  end

  def add_speedy_shipping
    @speedy_shipping = true
  end

  def summary_array
    total_cost = calculate_total_cost
    item_strings = format_each_item

    return create_speedy_summary(item_strings, total_cost) if @speedy_shipping
    create_normal_summary(item_strings, total_cost)
  end

  private

  def calculate_total_cost
    @items.inject(0) { |sum, item| sum + item.cost }
  end

  def format_each_item
    @items.map { |item| item.format_to_string }
  end

  def create_speedy_summary(items, total)
    items << "Speedy shipping: $#{total}"
    items << "Total cost: $#{SPEEDY_MULTIPLIER * total}"
  end

  def create_normal_summary(items, total)
    items << "Total cost: $#{total}"
  end
end
