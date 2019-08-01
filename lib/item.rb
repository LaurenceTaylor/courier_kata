class Item
  SMALL_SIZE = 10
  MEDIUM_SIZE = 50
  LARGE_SIZE = 100

  SIZE_COST_HASH = { 'Small' => 3, 'Medium' => 8, 'Large' => 15, 'XL' => 25 }

  SIZE_WEIGHT_HASH = { 'Small' => 1, 'Medium' => 3, 'Large' => 6, 'XL' => 10 }

  WEIGHT_COST_MULTIPLIER = 2

  attr_reader :cost

  def initialize(height, width, depth, weight)
    @category = categorise([height, width, depth])
    @weight = weight
    @cost = calculate_cost
  end

  def format_to_string
    "#{@category} parcel: $#{@cost}"
  end

  private

  def categorise(dimensions)
    max_side = dimensions.max

    return 'Small' if max_side < SMALL_SIZE
    return 'Medium' if max_side < MEDIUM_SIZE
    return 'Large' if max_side < LARGE_SIZE
    'XL' if max_side >= LARGE_SIZE
  end

  def calculate_cost
    SIZE_COST_HASH[@category] + additional_weight_cost
  end

  def additional_weight_cost
    diff = calculate_weight_difference
    diff > 0 ? WEIGHT_COST_MULTIPLIER * diff : 0
  end

  def calculate_weight_difference
    @weight - SIZE_WEIGHT_HASH[@category]
  end
end
