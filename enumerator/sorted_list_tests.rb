require "minitest/autorun"
require_relative "sorted_list"

describe "FakeEnumerable" do
	before do
		@list = SortedList.new

		@list << 3 << 13 << 42 << 4 << 7
	end

	it "supports map" do
		@list.map { |x| x + 1 }.must_equal([4, 5, 8, 14, 43])
	end

	it "supports select" do
		@list.select { |x| x.even? }.must_equal([4, 42])
	end

	it "supports sort_by" do
		@list.sort_by { |x| x.to_s }.must_equal([13, 3, 4, 42, 7])
	end

	it "supports reduce" do
    @list.reduce(:+).must_equal(69)
    @list.reduce { |s,e| s + e }.must_equal(69)
    @list.reduce(-10) { |s,e| s + e }.must_equal(59)
  end

  it "support cycle" do
  	cycle_list = @list.cycle
  	result = []

  	10.times { result << cycle_list.next }

  	result.must_equal([3, 4, 7, 13, 42, 3, 4, 7, 13, 42])
  end
end