# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ebook, type: :model do
  it { should belong_to(:provider) }

  # Validation tests
  # ensure column title is present before saving
  it { should validate_presence_of(:title) }
end