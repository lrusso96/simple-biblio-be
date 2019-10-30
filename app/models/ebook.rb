# frozen_string_literal: true

class Ebook < ApplicationRecord
  belongs_to :provider

  # validations
  validates_presence_of :title, :rel_id
  validates :rel_id, uniqueness: { scope: :provider }
end
