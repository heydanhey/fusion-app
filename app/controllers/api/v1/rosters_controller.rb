class Api::V1::RostersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def index
    @my_rosters = Roster.where(user_id: current_user)
    @rosters = Roster.all
  end

  def new
    @roster = Roster.new
  end

  def create
    @roster = Roster.new({user_id: current_user.id,
                          team_name: params[:team_name],
                          qb_1: params[:qb_1],
                          qb_2: params[:qb_2],
                          rb_1: params[:rb_1],
                          rb_2: params[:rb_2],
                          rb_3: params[:rb_3],
                          wr_1: params[:wr_1],
                          wr_2: params[:wr_2],
                          wr_3: params[:wr_3],
                          te_1: params[:te_1],
                          k_1: params[:k_1],
                          k_2: params[:k_2],
                          d_1: params[:d_1],
                          flex_1: params[:flex_1]
                          })


    if @roster.save
      
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.qb_1)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.qb_2)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.rb_1)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.rb_2)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.rb_3)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.wr_1)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.wr_2)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.wr_3)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.te_1)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.k_1)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.k_2)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.d_1)
      RosteredPlayer.create(roster_id: @roster.id, player_id: @roster.flex_1)

  #   @rostered_players = RosteredPlayer.where(roster_id: @roster.id)

  #   team_array = ["ARI", "CAR", "CIN", "DEN", "GB", "HOU", "KC", "MIN", "NE", "PIT", "SEA", "WAS"]

  #   @rostered_players.each do |team|
  #     if team_array.include?(team.player.team) && team.player.position != "FLEX"
  #       team_array.delete(team.player.team)
  #     else
  #       flash[:success] = "Error"
  #       redirect_to "/rosters"
  #     end
  #   end
      flash[:success] = "Roster Created"
      redirect_to "/rosters"
    else
      flash[:warning] = "Error"
      render 'new'
    end
  end

  def show
    @roster = Roster.find(params[:id])
    
  end

  def edit
    @roster = Roster.find(params[:id])
  end

  def update
    @roster = Roster.find(params[:id])
    @rostered_players = RosteredPlayer.where(roster_id: @roster.id)

    @roster.update({team_name: params[:team_name],
                          qb_1: params[:qb_1][:qb_1_id],
                          qb_2: params[:qb_2][:qb_2_id],
                          rb_1: params[:rb_1][:rb_1_id],
                          rb_2: params[:rb_2][:rb_2_id],
                          rb_3: params[:rb_3][:rb_3_id],
                          wr_1: params[:wr_1][:wr_1_id],
                          wr_2: params[:wr_2][:wr_2_id],
                          wr_3: params[:wr_3][:wr_3_id],
                          te_1: params[:te_1][:te_1_id],
                          k_1: params[:k_1][:k_1_id],
                          k_2: params[:k_2][:k_2_id],
                          d_1: params[:d_1][:d_1_id],
                          flex_1: params[:flex_1][:flex_1_id]
                          })

    @rostered_players[0].update(player_id: @roster.qb_1)
    @rostered_players[1].update(player_id: @roster.qb_2)
    @rostered_players[2].update(player_id: @roster.rb_1)
    @rostered_players[3].update(player_id: @roster.rb_2)
    @rostered_players[4].update(player_id: @roster.rb_3)
    @rostered_players[5].update(player_id: @roster.wr_1)
    @rostered_players[6].update(player_id: @roster.wr_2)
    @rostered_players[7].update(player_id: @roster.wr_3)
    @rostered_players[8].update(player_id: @roster.te_1)
    @rostered_players[9].update(player_id: @roster.k_1)
    @rostered_players[10].update(player_id: @roster.k_2)
    @rostered_players[11].update(player_id: @roster.d_1)
    @rostered_players[12].update(player_id: @roster.flex_1)

    flash[:success] = "Roster Updated"
    redirect_to "/rosters/#{@roster.id}"
  end

end
