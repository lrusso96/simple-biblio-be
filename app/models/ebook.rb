# frozen_string_literal: true

##
# This class represents an electronic book.
class Ebook < ApplicationRecord
  # association binding
  belongs_to :provider
  has_many :ebook_readers
  has_many :users, through: :ebook_readers

  # this model can be voted
  acts_as_votable

  # validations
  validates_presence_of %i[author title rel_id]
  validates :rel_id, uniqueness: { scope: :provider }

  def as_json(_options = {})
    dwn = EbookReader.where(ebook_id: id).count
    { id: rel_id,
      title: title,
      author: author,
      provider: provider,
      downloads: dwn,
      ratings: cached_votes_total,
      rating_avg: cached_weighted_average }
  end
end
