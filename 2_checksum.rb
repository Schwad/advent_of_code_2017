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

# Benchmark.bm do |x|
#   x.report('ChristmasChecksum:') { ChristmasChecksum.new(input) }
# end

# ChristmasChecksum:Total checksum is xxxxx
#        user     system      total        real
  # 0.000000   0.000000   0.000000 (  0.000129)
