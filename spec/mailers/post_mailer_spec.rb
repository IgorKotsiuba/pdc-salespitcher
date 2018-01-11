require "rails_helper"

RSpec.describe PostMailer, type: :mailer do
  describe 'send_notification' do
    let(:user) { create :user }
    let(:post) { create :post }

    it do
      mail = described_class.send_notification(user.id, post.id)

      expect(mail).to be_present
      expect(mail.subject).to eq 'Salespitcher Notification'
      expect(mail.to).to eq [user.email]
    end
  end
end
