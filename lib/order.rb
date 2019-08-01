class Order
  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def summary_array
    total_cost = calculate_total_cost
    @items.map { |item| item.format_to_string } << "Total cost: $#{total_cost}"
  end

  private

  def calculate_total_cost
    @items.inject(0) { |sum, item| sum + item.cost }
  end
end
