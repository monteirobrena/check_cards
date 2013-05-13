require 'spec_helper'

describe Card do

  cards = {
    1 => Card.new('4111111111111111'),
    2 => Card.new('4111111111111'),
    3 => Card.new('4012888888881881'),
    4 => Card.new('378282246310005'),
    5 => Card.new('6011111111111117'),
    6 => Card.new('5105105105105100'),
    7 => Card.new('5105105105105106'),
    8 => Card.new('9111111111111111')
  }

  cards.each do |index, card|

  	it "should be card valid" do
  	  message = card.is_valid?
  	  expect(card.is_valid?).not_to be_empty
  	  puts message
  	end

    it "should have a type" do
      expect(card.type).not_to be_empty
    end

    it "should be greater than 0" do
      expect(card.length).to be > 0
    end
  end
end
