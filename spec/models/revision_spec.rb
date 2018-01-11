require 'rails_helper'

RSpec.describe Revision, type: :model do
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
end
