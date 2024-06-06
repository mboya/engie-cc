module CustomAttributes
  extend ActiveSupport::Concern

  included do
    serialize :custom_attributes, coder: JSON
    before_save :initialize_custom_attributes

    def initialize_custom_attributes
      self.custom_attributes ||= '{}'
    end
  end

  # this is to add the value custom to the client
  def set_custom_attribute(key, value)
    self.custom_attributes[key.to_s] = value
  end

  # this is to fetch the custom data
  def get_custom_attribute(key)
    self.custom_attributes[key.to_s]
  end

  # delete
  def remove_custom_attribute(key)
    self.custom_attributes.delete(key.to_s)
  end

  # check if the key exists
  def custom_attribute?(key)
    self.custom_attributes.key?(key.to_s)
  end

  # to be able to view all the keys that are attached to a record
  def custom_attributes_keys
    self.custom_attributes.keys
  end

  # this is to remove all the custom attributes from the class/model
  def clear_custom_attributes
    self.custom_attributes.clear
  end

  module ClassMethods
    def find_by_custom_attribute(key, value)
      all.select { |record| record.custom_attributes[key.to_s] == value }
    end
  end
end
