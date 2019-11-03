# frozen_string_literal: true

##
# This class represents a third-party Ebook provider
class Provider < ApplicationRecord
  # validations
  validates_presence_of :name

  def as_json(_options = {})
    { name: name,
      id: id }
  end
end
