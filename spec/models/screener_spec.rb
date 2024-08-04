require 'rails_helper'

RSpec.describe Screener, type: :model do
  it { should validate_presence_of(:name) }
end
