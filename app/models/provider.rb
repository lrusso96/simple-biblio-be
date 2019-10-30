# frozen_string_literal: true

class Provider < ApplicationRecord
  # validations
  validates_presence_of :name
end
