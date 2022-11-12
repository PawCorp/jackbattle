class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]
  before_action :require_login, only: %i[ mine new edit create update destroy ]
  before_action :must_be_creator, only: %i[ edit update destroy ]

  # GET /games
  def index
    #@games = Game.joins(:participants).where(participants: { present: true }).distinct
    @games = Game.all
  end

  # GET /games/mine
  def mine
    @games = Game.where(creator: current_user).all
    render :index
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = current_user.games.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_url(@game), notice: "Game was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    if @game.update(game_params)
      redirect_to game_url(@game), notice: "Game was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:creator_id, :name)
  end

  def must_be_creator
    is_creator = @game.creator == current_user
    redirect_to sign_in_url, alert: "You aren't authenticated to do that." unless is_creator
  end
end
