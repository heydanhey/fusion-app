class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
  end

  def create
    @players = Player.create(name: params[:name],
                              team: params[:team],
                              position: params[:position])

    flash[:success] = "Player Created"
    redirect_to "/players"
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(name: params[:name],
                    team: params[:team],
                    position: params[:position],
                    week_1_score: params[:week_1_score],
                    week_2_score: params[:week_2_score],
                    week_3_score: params[:week_3_score],
                    week_4_score: params[:week_4_score])

    flash[:success] = "Player Updated"
    redirect_to "/players"
  end

  def destroy
    @player = Player.find(params[:id])
  end

end
