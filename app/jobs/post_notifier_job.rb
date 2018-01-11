class PostNotifierJob < ApplicationJob
  queue_as :default

  def perform(user_id, post_id)
    PostMailer.send_notification(user_id, post_id).deliver_later
  end
end
