class Game < ApplicationRecord
  include GamesHelper

  belongs_to :creator, class_name: 'User', inverse_of: :games
  has_many :participants, dependent: :destroy
  has_many :participating_users, class_name: 'Game', through: :participants, source: :user

  after_update_commit do
    update_thumbnails
  end

  def after_update_participants
    update_thumbnails
  end

  private

  def update_thumbnails
    broadcast_replace target: (game_thumbnail_id self), html: ApplicationController.render_component(GameThumbnailComponent.new(game: self))
  end
end
