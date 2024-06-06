# == Schema Information
#
# Table name: batteries
#
#  id                :integer          not null, primary key
#  capacity          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  custom_attributes :text             default({})
#
require "test_helper"

class BatteryTest < ActiveSupport::TestCase
  def setup
    @battery = batteries(:one)
    @customer = customers(:two)
  end

  test "should be valid" do
    assert @battery.valid?
  end

  test "should initialize custom attributes" do
    assert_equal({}, @battery.custom_attributes)
  end

  test "should set and get custom attributes" do
    @battery.set_custom_attribute(:make, 'duracell')
    @battery.set_custom_attribute(:model, '3321')
    assert_equal 'duracell', @battery.get_custom_attribute(:make)
    assert_equal '3321', @battery.get_custom_attribute(:model)
  end

  test "should remove custom attributes" do
    @battery.set_custom_attribute(:make, 'duracell')
    @battery.remove_custom_attribute(:make)
    assert_nil @battery.get_custom_attribute(:email)
  end

  test "should check if custom attribute exists" do
    @battery.set_custom_attribute(:model, '3321')
    assert @battery.custom_attribute?(:model)
    @battery.remove_custom_attribute(:model)
    refute @battery.custom_attribute?(:model)
  end

  # test "the truth" do
  #   assert true
  # end
end
