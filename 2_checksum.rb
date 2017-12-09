class ChristmasChecksum

  attr_accessor :input_array, :checksum_total

  def initialize(input)
    @input_array = input
    @checksum_total = 0
    inspect_rows
    puts "Total checksum is #{checksum_total}"
  end

  private

  def input_array
    @input_array
  end

  def row_checksum(row)
    min_max = row.minmax
    min_max[1] - min_max[0]
  end

  def inspect_rows
    input_array.each do |row|
      @checksum_total += row_checksum(row)
    end
  end
end

class ChristmasEvenlyDivisible
  attr_accessor :divisible_total, :input_array

  def initialize(input)
    @input_array = input
    @divisible_total = 0
    inspect_rows
    puts "Total evenly divisible is #{divisible_total}"
  end

  private

  def evenly_divisible_check(number_one, number_two)
    @divisible_total += (number_one.to_f / number_two.to_f) if (number_one.to_f / number_two.to_f) % 1 == 0
  end

  def inspect_rows
    @input_array.each do |row|
      row.each do |element|
        row.each do |second_element|
          next if element == second_element
          evenly_divisible_check(element, second_element)
        end
      end
    end
  end
end

Benchmark.bm do |x|
  x.report('ChristmasChecksum:') { ChristmasChecksum.new(input) }
end

Benchmark.bm do |x|
  x.report('ChristmasEvenlyDivisible:') { ChristmasEvenlyDivisible.new(input) }
end

# ChristmasChecksum:Total checksum is xxxxx
#       user     system      total        real
# 0.000000   0.000000   0.000000 (  0.000129)
# ChristmasEvenlyDivisible:Total evenly divisible is xxxxx
#      user     system      total        real
# 0.000000   0.000000   0.000000 (  0.001000)
