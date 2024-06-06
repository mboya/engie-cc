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
class Battery < ApplicationRecord
  include CustomAttributes
end
