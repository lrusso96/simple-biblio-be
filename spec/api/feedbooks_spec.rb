# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feedbooks do
  context 'when valid id' do
    it 'returns an ebook' do
      ret = Feedbooks.search(22)
      expect(ret).not_to be_nil
      expect(ret.title).not_to be_empty
      expect(ret.author).not_to be_empty
    end
  end
end