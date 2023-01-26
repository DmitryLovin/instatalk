class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "OnlineChannel"
    current_user.update(is_online: true);

    OnlineService.new(user: current_user, status: :connected).perform
  end

  def unsubscribed
    current_user.update(is_online: false);

    OnlineService.new(user: current_user, status: :disconnected).perform
  end
end
