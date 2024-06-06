# == Schema Information
#
# Table name: customers
#
#  id                :integer          not null, primary key
#  name              :string
#  phone_number      :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  custom_attributes :text             default({})
#
require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:one)
  end

  test "should be valid" do
    assert @customer.valid?
  end

  test "should initialize custom attributes" do
    assert_equal({}, @customer.custom_attributes)
  end

  test "should set and get custom attributes" do
    @customer.set_custom_attribute(:email, 'customer@engie.com')
    assert_equal 'customer@engie.com', @customer.get_custom_attribute(:email)
  end

  test "should remove custom attributes" do
    @customer.set_custom_attribute(:email, 'customer@engie.com')
    @customer.remove_custom_attribute(:email)
    assert_nil @customer.get_custom_attribute(:email)
  end

  test "should check if custom attribute exists" do
    @customer.set_custom_attribute(:email, 'customer@engie.com')
    assert @customer.custom_attribute?(:email)
    @customer.remove_custom_attribute(:email)
    refute @customer.custom_attribute?(:email)
  end

  test "should get custom attributes keys" do
    @customer.set_custom_attribute(:email, 'customer@engie.com')
    @customer.set_custom_attribute(:hometown, 'Nansana')
    assert_equal ['email', 'hometown'], @customer.custom_attributes_keys
  end

  test "should clear custom attributes" do
    @customer.set_custom_attribute(:email, 'customer@engie.com')
    @customer.set_custom_attribute(:hometown, 'Kira')
    @customer.clear_custom_attributes
    assert @customer.custom_attributes.empty?
  end

  test "should find by custom attribute" do
    @customer.set_custom_attribute(:email, 'customer@engie.com')
    @customer.save

    found_customers = Customer.find_by_custom_attribute(:email, 'customer@engie.com')
    assert_includes found_customers, @customer
  end

  # test "the truth" do
  #   assert true
  # end
end
