# Courier Kata

Creating a code library to calculate the cost of sending an order of parcels.

## How to run

* Clone this repository.

* Run `bundle install` in your command line.

* Enter `irb`, then `require './lib/item.rb'` followed by `require './lib/order.rb'`.

* Create a new item with `item_1 = Item.new(4, 5, 6, 5)` - the arguments are its 3 dimensions followed by height.

* Create a new order with `order = Order.new`. You can add to this order by adding an item, as such: `order.add(item_1)`. You can add speedy shipping by running `order.add_speedy_shipping`. View the summary array of your order by running `order.summary_array`.

* To run tests, exit irb and enter `rspec` from the root directory.

![RSpec Screenshot](/test_screenshot.png)

## Code Example

```
irb
2.6.0 :001 > require './lib/item.rb'
2.6.0 :002 > require './lib/order.rb'
2.6.0 :003 > item_1 = Item.new(5, 4, 6, 7)
 => #<Item:0x00007fc9c68cf428 @category="Small", @weight=7, @cost=15>
2.6.0 :004 > item_2 = Item.new(1, 1, 1, 1)
 => #<Item:0x00007fc9c68dd8e8 @category="Small", @weight=1, @cost=3>
2.6.0 :005 > item_3 = Item.new(10, 10, 10, 10)
 => #<Item:0x00007fc9c6039f20 @category="Medium", @weight=10, @cost=22>
2.6.0 :006 > order = Order.new
2.6.0 :007 > order.add(item_1)
2.6.0 :008 > order.add(item_2)
2.6.0 :009 > order.add(item_3)
2.6.0 :010 > order.summary_array
 => ["Small parcel: $15", "Small parcel: $3", "Medium parcel: $22", "Total cost: $40"]
2.6.0 :011 > order.add_speedy_shipping
2.6.0 :012 > order.summary_array
 => ["Small parcel: $15", "Small parcel: $3", "Medium parcel: $22", "Speedy shipping: $40", "Total cost: $80"]
```

## Approach

* Business logic only, programmatic API using irb.
* Tried to follow OOP principles.
* TDD -> red, green, refactor. Tested in isolation, 100% test coverage.
* Refactored at other stages when I felt it was appropriate.
* There are no rubocop offences.

## Thoughts

* It's likely it would have been more useful to output an array of hashes rather than formatted strings.
* Keyword arguments would have been a good idea for initializing Item objects, it would have been clearer.
* Could rename SIZE_COST_HASH and SIZE_WEIGHT_HASH constants to be more explicit.
* Wondering how I can refactor this solution further.
* There are more implementation steps (this solution completed 3), but I ran out of time.

## Further implementation steps?

4) In the Item class, I would have added a method to compare the result of `#calculate_cost` with the expense of a heavy parcel. If the heavy parcel is cheaper, I would set `@cost` to that rate, and set `@category` to `'Heavy'`.

5) I would add an `apply_discounts` method in the Order class which would iterate through the items array (perhaps with .each), counting the instances of small/ medium/ all parcels. With each correct multiple, I would append a discount object to `@items` with a `@cost` variable of minus the original cost. This would probably be called within the `summary_array` method.

## Specification

1) The initial implementation just needs to take into account a parcel's size. For each size
type there is a fixed delivery cost:
* Small parcel: all dimensions < 10cm. Cost $3
* Medium parcel: all dimensions < 50cm. Cost $8
* Large parcel: all dimensions < 100cm. Cost $15
* XL parcel: any dimension >= 100cm. Cost $25

2) Thanks to logistics improvements we can deliver parcels faster. This means we can
charge more money. Speedy shipping can be selected by the user to take advantage of our
improvements.
* This doubles the cost of the entire order
* Speedy shipping should be listed as a separate item in the output, with its associated
cost
* Speedy shipping should not impact the price of individual parcels, i.e. their individual
cost should remain the same as it was before

3) There have been complaints from delivery drivers that people are taking advantage of our
dimension only shipping costs. A new weight limit has been added for each parcel type, over
which a charge per kg of weight applies +$2/kg over weight limit for parcel size:
* Small parcel: 1kg
* Medium parcel: 3kg
* Large parcel: 6kg
* XL parcel: 10kg
