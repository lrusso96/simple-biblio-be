# frozen_string_literal: true

class Ebook < ApplicationRecord
  belongs_to :provider
  has_many :ebook_readers
  has_many :users, through: :ebook_readers

  # validations
  validates_presence_of :author, :title, :rel_id
  validates :rel_id, uniqueness: { scope: :provider }

  def as_json(options={})
    { title: title,
      author: author,
      provider: provider,
      id: rel_id
    }
  end
end
