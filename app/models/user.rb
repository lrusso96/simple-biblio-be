# frozen_string_literal: true

##
# This class represents a registered user in the app.
class User < ApplicationRecord
  # store encrypted password
  has_secure_password

  # association binding
  has_many :ebook_readers
  has_many :ebooks, through: :ebook_readers

  # can vote ebooks
  acts_as_voter

  # validations
  validates_presence_of :name, :email, :password_digest
end
