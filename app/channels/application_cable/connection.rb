module ApplicationCable
  class Connection < ActionCable::Connection::Base
    attr_accessor :active_game, :current_user

    def connect
      @active_game = nil
      @current_user = find_user
    end

    def disconnect
      if @active_game && @current_user
        @active_game.participants.where(user: @current_user).destroy_all
      end
    end

    private

    def find_user
      if remember_token.present?
        @current_user ||= user_from_remember_token(remember_token)
      end

      @current_user
    end

    def cookies
      @cookies ||= ActionDispatch::Request.new(@env).cookie_jar
    end

    def remember_token
      cookies[Clearance.configuration.cookie_name.freeze]
    end

    def user_from_remember_token(token)
      Clearance.configuration.user_model.where(remember_token: token).first
    end
  end
end
