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
class Customer < ApplicationRecord
  include CustomAttributes
end
