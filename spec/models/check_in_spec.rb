require "rails_helper"

RSpec.describe CheckIn, type: :model do
  it { is_expected.to belong_to(:patient) }
end
