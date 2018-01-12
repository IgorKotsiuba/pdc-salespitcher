require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name)  }
  it { is_expected.to have_and_belong_to_many(:groups)  }
  it { is_expected.to have_many(:posts).through(:groups)  }

  context '#full name' do
    let(:user) { create :user, first_name: 'Dan', last_name: 'Brown' }

    it { expect(user.full_name).to eq 'Dan Brown' }
  end
end
