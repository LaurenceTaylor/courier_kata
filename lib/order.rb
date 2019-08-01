class Order
  SPEEDY_MULTIPLIER = 2

  def initialize
    @items = []
    @is_speedy_shipping = false
  end

  def add(item)
    @items << item
  end

  def add_speedy_shipping
    @is_speedy_shipping = true
  end

  def summary_array
    total_cost = calculate_total_cost
    items = format_each_item

    return create_speedy_summary(items, total_cost) if @is_speedy_shipping
    create_normal_summary(items, total_cost)
  end

  private

  def calculate_total_cost
    @items.inject(0) { |sum, item| sum + item.cost }
  end

  def format_each_item
    @items.map { |item| item.format_to_string }
  end

  def create_speedy_summary(items, total_cost)
    items << "Speedy shipping: $#{total_cost}"
    items << "Total cost: $#{SPEEDY_MULTIPLIER * total_cost}"
    items
  end

  def create_normal_summary(items, total_cost)
    items << "Total cost: $#{total_cost}"
  end
end
