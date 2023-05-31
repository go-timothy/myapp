require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:detail) }
  it { is_expected.to validate_length_of(:detail).is_at_least(10) }
  it { is_expected.to belong_to(:user) }
end
