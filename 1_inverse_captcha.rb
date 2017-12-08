class InverseCaptchaSumTotaller

  attr_accessor :input_string

  def initialize(input_string=nil)
    @input_string = input_string
    process_string
    circular_check
    puts "Sum is #{captcha_sum.total}"
  end

  private

  def process_string
    input_string.split('')[0..-2].each_with_index do |element, index|
      matched_digits?(element.to_i, input_string[index + 1].to_i)
    end
  end

  def matched_digits?(input_one, input_two)
    captcha_sum.total += input_one if input_one == input_two
  end

  def circular_check
    captcha_sum.total += input_string[0].to_i if input_string[-1] == input_string[0]
  end

  def captcha_sum
    @captcha_sum ||= CaptchaSum.new
  end

  def input_string
    @input_string
  end
end

class CaptchaSum
  attr_accessor :total

  def initialize
    @total = 0
  end
end

# Benchmark.bm do |x|
#   x.report('InverseCaptchaSumTotaller:') { InverseCaptchaSumTotaller.new(input) }
# end
#        user     system      total        real
#   0.010000   0.000000   0.010000 (  0.007425)
