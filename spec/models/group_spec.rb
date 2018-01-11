require 'rails_helper'

RSpec.describe Group, type: :model do
  it { is_expected.to have_and_belong_to_many(:users) }
  it { is_expected.to have_many(:posts) }

  it { is_expected.to validate_presence_of(:name) }

  describe 'custom validations' do
    subject { create :group }

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
