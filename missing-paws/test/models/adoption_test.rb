require 'test_helper'

class AdoptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "adoption attributes must not be empty" do
		adoption = Adoption.new
		assert adoption.invalid?
		assert adoption.errors[:title].any?
		assert adoption.errors[:description].any?
		assert adoption.errors[:name].any?
		assert adoption.errors[:phone].any?
		assert adoption.errors[:email].any?
		assert adoption.errors[:city].any?
	end

end
