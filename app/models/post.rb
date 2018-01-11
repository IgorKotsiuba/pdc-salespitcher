class Post < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader
  belongs_to :group
  has_many :revisions, dependent: :destroy

  validates :title, presence: true
  validates :body,  presence: true

  after_validation :generate_uid_token, on: :create

  private

  def generate_uid_token
    loop do
      uuid_token = SecureRandom.uuid
      break self.uuid = uuid_token unless self.class.where(uuid: uuid_token).exists?
    end
  end
end
