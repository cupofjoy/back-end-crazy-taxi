class Api::V1::GamesController < ApplicationController
  def index
    games = Game.all
    objs = games.map do |game|
      {
        username: game.user.username,
        user_id: game.user_id,
        score: game.score
      }
    end
    render json: objs
    # render json: games.map {|g| "#{g.score} - #{g.user.username}"}
  end

  def create
    game = Game.create(game_params)
    render json: game
  end

  private
  def game_params
    params.permit(:user_id, :score)
  end
end
