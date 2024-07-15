require "rails_helper"

RSpec.describe ScreeningType, type: :model do
  it { should validate_presence_of(:name) }
end
