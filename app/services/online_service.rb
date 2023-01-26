class OnlineService
  def initialize(user:, status:)
    @user = user
    @status = status
  end

  def perform
    case @status
    when :connected then send_connected
    when :disconnected then send_disconnected
    end
  end

  private

  def send_connected
    ActionCable.server.broadcast("OnlineChannel",
                                 { user: render_user })
  end

  def send_disconnected
    ActionCable.server.broadcast("OnlineChannel",
                                 { user_id: @user.id })
  end

  def render_user
    ApplicationController.renderer.render(partial: 'users/user', locals: {
      user: @user
    })
  end
end
