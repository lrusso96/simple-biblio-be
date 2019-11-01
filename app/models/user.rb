# frozen_string_literal: true

class User < ApplicationRecord
  # encrypt password
  has_secure_password

  has_many :ebook_readers
  has_many :ebooks, through: :ebook_readers

  # Validations
  validates_presence_of :name, :email, :password_digest
end
