# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Libgen do
  context 'when valid id' do
    it 'returns an ebook' do
      ret = Libgen.search(rand( 2_000_000))
      expect(ret).not_to be_nil
      expect(ret.title).not_to be_empty
      # expect(ret.author).not_to be_empty
    end
  end
end