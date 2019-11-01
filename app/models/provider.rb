# frozen_string_literal: true

class Provider < ApplicationRecord
  # validations
  validates_presence_of :name

  def as_json(options={})
    { name: name,
      id: id, }
  end
end
