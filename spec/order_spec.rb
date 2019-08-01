require 'order'

describe Order do
  let(:item_double) do
    double(:item, format_to_string: 'Small parcel: $3', cost: 3)
  end

  before(:each) do
    3.times { subject.add(item_double) }
  end

  describe '#summary_array' do
    it 'should return an array with each item and the total cost' do
      expect(subject.summary_array).to eq(['Small parcel: $3',
                                          'Small parcel: $3',
                                          'Small parcel: $3',
                                          'Total cost: $9'])
    end
  end

  describe '#add_speedy_shipping' do
    it 'should add an item to the output, and double the cost of the order' do
      subject.add_speedy_shipping
      expect(subject.summary_array).to eq(['Small parcel: $3',
                                          'Small parcel: $3',
                                          'Small parcel: $3',
                                          'Speedy shipping: $9',
                                          'Total cost: $18'])
    end
  end
end
