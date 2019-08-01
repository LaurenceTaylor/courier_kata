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
    total_cost = 0
    @items.each { |item| total_cost += item.cost }
    total_cost
  end
end
