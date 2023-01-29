class PresenceChannel < ApplicationCable::Channel
  def self.user_still_connected?(user)
    broadcast_to(user, action: 'presence-check').to_i.positive?
  end

  def subscribed
    stream_from "PresenceChannel"
    stream_for current_user
  end
end
