class Item
  SMALL = 10
  MEDIUM = 50
  LARGE = 100

  attr_reader :cost

  def initialize(height, width, depth)
    @category = categorise([height, width, depth])
    @cost = calculate_cost
  end

  def format_to_string
    "#{@category} parcel: $#{@cost}"
  end

  private

  def categorise(dimensions)
    max_side = dimensions.max
    return 'Small' if max_side < SMALL
    return 'Medium' if max_side < MEDIUM
    return 'Large' if max_side < LARGE
    return 'XL' if max_side >= LARGE
  end

  def calculate_cost
    case @category
    when 'Small'
      return 3
    when 'Medium'
      return 8
    when 'Large'
      return 15
    when 'XL'
      return 25
    end
  end
end
