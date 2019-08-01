require 'order'

describe Order do
  let(:item_double) do
    double(:item, format_to_string: 'Small parcel: $3', cost: 3)
  end

  describe '#summary_array' do
    it 'should return an array with each item and the total cost' do
      3.times { subject.add(item_double) }
      expect(subject.summary_array).to eq(['Small parcel: $3',
                                          'Small parcel: $3',
                                          'Small parcel: $3',
                                          'Total cost: $9'])
    end
  end
end
