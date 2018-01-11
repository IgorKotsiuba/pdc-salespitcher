require 'rails_helper'

RSpec.describe Admin::PostsController, type: :controller do
  before { sign_in admin }

  let!(:admin) { create :admin }
  let!(:post1) { create :post, title: 'Opsss', body: 'No content' }
  let!(:post2) { create :post }
  let!(:group) { create :group }

  describe "POST #create" do
    let(:file1) do
      Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'files', 'attention.jpg'), 'image/jpeg')
    end
    let(:valid_attributes) do
      { title: 'Attention', body: 'Attention, please', group_id: group.id, attachments: [file1] }
    end

    context 'with valid params' do
      it 'creates a new post' do
        expect {
          post :create, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)

        Post.last.tap do |post|
          expect(post.title).to                           eq 'Attention'
          expect(post.body).to                            eq 'Attention, please'
          expect(post.attachments.first.file.filename).to eq 'attention.jpg'
        end
      end

      it "redirects to the created admin_post" do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to(admin_post_path(Post.last))
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title: 'Attention', body: 'Attention, please' } }

      it 'updates the requested admin_post' do
        put :update, params: {id: post1.id, post: new_attributes}
        post1.reload

        expect(post1.title).to eq 'Attention'
        expect(post1.body).to  eq 'Attention, please'
        expect(post1.attachments).to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested admin_post' do
      expect { delete :destroy, params: {id: post1.id} }.to change(Post, :count).by(-1)
    end
  end
end
