# frozen_string_literal: true

require 'httparty'

class Libgen
  def self.search(id)
    fields = 'Author,Title'
    headers = { 'Content-EventType' => 'application/x-www-form-urlencoded',
                Accept: 'application/json' }
    params = { fields: fields, ids: id }
    options = { headers: headers, body: params }
    res = HTTParty.post('http://93.174.95.27/json.php', options)
    book = parse_ebook JSON.parse res.body
    book.rel_id = id
    book
  end

  # @param [Hash] res
  def self.parse_ebook(res)
    res = res.first
    book = Ebook.new
    book.author = res['author']
    book.title = res['title']
    # name: 'libgen'
    book.provider = Provider.find_by(id: 1)
    book
  end
end