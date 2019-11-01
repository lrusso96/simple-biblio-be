# frozen_string_literal: true

class EbookReader < ApplicationRecord
  belongs_to :ebook
  belongs_to :user

  # validations
  validates_presence_of :ebook
  validates :ebook_id, uniqueness: { scope: :user }
end
