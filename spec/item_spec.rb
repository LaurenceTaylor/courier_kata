require 'item'

describe Item do
  let(:small_parcel) { Item.new(9, 9, 9) }
  let(:medium_parcel) { Item.new(49, 49, 49) }
  let(:large_parcel) { Item.new(99, 99, 99) }
  let(:xl_parcel) { Item.new(100, 100, 100) }

  describe '#format_string' do
    it 'should format item size and cost into a string' do
      expect(small_parcel.format_to_string).to eq('Small parcel: $3')
      expect(medium_parcel.format_to_string).to eq('Medium parcel: $8')
      expect(large_parcel.format_to_string).to eq('Large parcel: $15')
      expect(xl_parcel.format_to_string).to eq('XL parcel: $25')
    end
  end
end
