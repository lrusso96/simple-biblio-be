# frozen_string_literal: true

##
# This class represents an association between users and the ebooks he reads
# and downloads.
class EbookReader < ApplicationRecord
  # association binding
  belongs_to :ebook
  belongs_to :user

  # validations
  validates_presence_of :ebook
  validates :ebook_id, uniqueness: { scope: :user }

  def as_json(_options = {})
    { downloaded_at: created_at,
      ebook: ebook }
  end
end
