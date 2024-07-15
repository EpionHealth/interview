require "rails_helper"

RSpec.describe AnswerOption, type: :model do
  it { is_expected.to belong_to(:screening_type) }
end
