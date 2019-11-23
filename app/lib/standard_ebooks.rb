# frozen_string_literal: true

require 'httparty'
require 'nokogiri'

class StandardEbooks
  def self.search(id)
    ret = load_all[id.to_i]
    raise ActiveRecord::RecordNotFound, 'Ebook not found.' unless ret

    ret
  end

  def self.load_all
    ids = recent_ids
    res = HTTParty.get 'https://standardebooks.org/opds/all'
    entries = Nokogiri.XML(res.body).css 'entry'
    ret = []
    entries.each_with_index do |e, i|
      ret << parse_ebook(e, i) if ids.include? e.at_css('id').text
    end
    ret
  end

  def self.recent_ids
    res = HTTParty.get 'https://standardebooks.org/rss/new-releases'
    doc = Nokogiri.XML res.body
    items = doc.css 'item'
    links = []
    items.each do |item|
      links << item.at_css('link').text
    end
    links
  end

  # @param [Nokogiri::XML::Element] elem
  def self.parse_ebook(elem, id)
    book = Ebook.new
    book.rel_id = id
    book.author = elem.at_css('author').at_css('name').text
    book.title = elem.at_css('title').text
    book.provider = Provider.find_by(id: 3)
    book
  end
end
