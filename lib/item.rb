class Item
  SMALL_SIZE = 10
  MEDIUM_SIZE = 50
  LARGE_SIZE = 100

  SMALL_WEIGHT = 1
  MEDIUM_WEIGHT = 3
  LARGE_WEIGHT = 6
  XL_WEIGHT = 10

  SMALL_COST = 3
  MEDIUM_COST = 8
  LARGE_COST = 15
  XL_COST = 25

  COST_SIZE_HASH = { 'Small' => SMALL_COST, 'Medium' => MEDIUM_COST,
                     'Large' => LARGE_COST, 'XL' => XL_COST }

  WEIGHT_SIZE_HASH = { 'Small' => SMALL_WEIGHT, 'Medium' => MEDIUM_WEIGHT,
                       'Large' => LARGE_WEIGHT, 'XL' => XL_WEIGHT }

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
    return 'XL' if max_side >= LARGE_SIZE
  end

  def calculate_cost
    COST_SIZE_HASH[@category] + additional_weight_cost
  end

  def additional_weight_cost
    diff = calculate_weight_difference
    diff > 0 ? WEIGHT_COST_MULTIPLIER * diff : 0
  end

  def calculate_weight_difference
    @weight - WEIGHT_SIZE_HASH[@category]
  end
end
