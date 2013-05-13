class Card

  DOUBLE = 2
  MODULUS_TEN = 10

  def initialize number
    @number = number
  end

  def number
  @number
  end

  def length
  @number.length
  end

  class Amex
    def starts_with?(number)
      number.match(/^(34|37)/)
    end

    def is_length_valid?(number)
      number.length == 15
    end

    def name
      'AMEX'
    end
  end

  class Discover
    def starts_with?(number)
      number.match(/^(6011)/)
    end

    def is_length_valid?(number)
      number.length == 16
    end

    def name
      'Discover'
    end
  end

  class MasterCard
    def starts_with?(number)
      number.match(/^(51|55)/)
    end

    def is_length_valid?(number)
      number.length == 6
    end

    def name
      'MasterCard'
    end
  end

  class Visa
    def starts_with?(number)
      number.match(/^(4)/)
    end

    def is_length_valid?(number)
      number.length == 13 || number.length == 16
    end

    def name
      'VISA'
    end
  end

  class Unknown
    def starts_with?(number)
      true
    end

    def is_length_valid?(number)
      true
    end

    def name
      'Unknwon'
    end
  end

  def types
    amex = Amex.new
    discover = Discover.new
    mastercard = MasterCard.new
    visa = Visa.new
    unknown = Unknown.new

    [amex, discover, mastercard, visa, unknown]
  end

  def types_for_number(number)
    types.find {|type| type.starts_with?(number)}
  end

  def type
    types_for_number(@number).name
  end

  def length_by_type
    types.find {|type| type.is_length_valid?(number)}
  end

  def double_digits
    number_to_array = @number.split(//)
    array_to_sum = number_to_array.each_with_index.collect {|element, index| index % DOUBLE == 0 ? element.to_i * 2 : element}
  end

  def get_sum array_to_sum
    sum = 0
    array_to_sum.join.split(//).each {|element| sum += element.to_i}
    sum
  end

  def number_is_valid?
    sum = get_sum(double_digits)
    sum % MODULUS_TEN == 0
  end

  def is_valid?
    type << ': ' << @number << ' (' << ((length_by_type && number_is_valid?) ? 'valid' : 'invalid') << ')'
  end
end
