require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:group) }
  it { is_expected.to have_many(:revisions).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body)  }
end
