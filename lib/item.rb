class Item
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
    return 'Small' if dimensions.all? { |dimension| dimension < 10 }
    return 'Medium' if dimensions.all? { |dimension| dimension < 50 }
    return 'Large' if dimensions.all? { |dimension| dimension < 100 }
    return 'XL' if dimensions.all? { |dimension| dimension >= 100 }
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
