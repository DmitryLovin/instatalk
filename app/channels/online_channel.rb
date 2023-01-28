class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "OnlineChannel"

    OnlineService.new(user: current_user, is_online: true).perform
  end

  def unsubscribed
    OnlineService.new(user: current_user, is_online: false).perform
  end
end
