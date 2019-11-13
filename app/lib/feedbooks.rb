# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

class Feedbooks
  def self.search(id)
    # TODO: handle errors
    res = HTTParty.post "http://feedbooks.com/book/#{id}.atom"
    doc = Nokogiri.XML res
    book = Ebook.new
    book.rel_id = id
    book.title = doc.at_css('title').text
    book.author = doc.at_css('name').text
    book.title = doc.at_css('title').text
    book.provider = Provider.find_by(id: 2)
    book
  end
end
