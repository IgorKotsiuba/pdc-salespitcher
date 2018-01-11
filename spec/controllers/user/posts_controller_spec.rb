require 'rails_helper'

RSpec.describe User::PostsController, type: :controller do
  before { sign_in user }

  let!(:user)  { create :user }
  let!(:post1) { create :post }
  let!(:post2) { create :post }

  describe 'GET #index' do
    before { get :index, params: {} }
    let(:result) { [post1, post2] }

    it { expect(response).to be_success }
    it { expect(response).to render_template :index }
    it { expect(subject.instance_variable_get(:@posts)).to match_array result }
  end

  describe 'GET #show' do
    let!(:revision) { create :revision, user: user, post: post2 }

    it 'create revision record and returns a success response' do
      expect { get :show, params: { uuid: post1.uuid } }.to change(Revision, :count).by(1)
      expect(response).to be_success
    end

    it 'do not create revision record and returns a success response' do
      expect { get :show, params: { uuid: post2.uuid } }.not_to change(Revision, :count)
      expect(response).to be_success
    end
  end
end
