class PostMailer < ApplicationMailer
  def send_notification(user_id, post_id)
    @user = User.find(user_id)
    @post = Post.find(post_id)
    mail(to: @user.email, subject: 'Salespitcher Notification')
  end
end
