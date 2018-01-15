class ApplicationCable::PostRevisionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'post_revisions'
  end
end
