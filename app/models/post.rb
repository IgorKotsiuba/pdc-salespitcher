class Post < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader

  validates :title, presence: true
  validates :body,  presence: true
end
