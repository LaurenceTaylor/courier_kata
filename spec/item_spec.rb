require 'item'

describe Item do
  let(:small_parcel) { Item.new(9, 9, 9, 1) }
  let(:medium_parcel) { Item.new(49, 49, 49, 2) }
  let(:large_parcel) { Item.new(99, 99, 99, 5) }
  let(:xl_parcel) { Item.new(100, 100, 100, 10) }

  let(:overweight_small) { Item.new(9, 9, 9, 2) }
  let(:overweight_medium) { Item.new(49, 49, 49, 5) }
  let(:overweight_large) { Item.new(99, 99, 99, 9) }
  let(:overweight_xl) { Item.new(100, 100, 100, 14) }

  context 'the item is not over weight' do
    describe '#format_string' do
      it 'should format item size and cost into a string' do
        expect(small_parcel.format_to_string).to eq('Small parcel: $3')
        expect(medium_parcel.format_to_string).to eq('Medium parcel: $8')
        expect(large_parcel.format_to_string).to eq('Large parcel: $15')
        expect(xl_parcel.format_to_string).to eq('XL parcel: $25')
      end
    end
  end

  context 'the item is over weight' do
    describe '#format_string' do
      it 'should show cost including weight calculation' do
        expect(overweight_small.format_to_string).to eq('Small parcel: $5')
        expect(overweight_medium.format_to_string).to eq('Medium parcel: $12')
        expect(overweight_large.format_to_string).to eq('Large parcel: $21')
        expect(overweight_xl.format_to_string).to eq('XL parcel: $33')
      end
    end
  end
end
