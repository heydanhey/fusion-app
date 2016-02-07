class RostersController < ApplicationController
  def index
    @rosters = Roster.all
  end

  def new
  end

  def create
    @roster = Roster.create({user_id: params[:user_id],
                          team_name: params[:team_name],
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
                          flex_1: params[:flex_1][:flex_1_id],
                          })

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

    flash[:success] = "Roster Created"
    redirect_to "/rosters"
  end

  def show
    @roster = Roster.find(params[:id])
  end

  def edit
    @roster = Roster.find(params[:id])
  end

  def update
    @roster = Roster.find(params[:id])

    @roster.update({user_id: params[:user_id],
                          team_name: params[:team_name],
                          qb_1: params[:player][:player_id]
                          })

    flash[:success] = "Roster Updated"
    redirect_to "/rosters/#{@roster.id}"
  end

end
