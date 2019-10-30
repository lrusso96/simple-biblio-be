require 'rails_helper'

RSpec.describe Provider, type: :model do
  # Validation tests
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
