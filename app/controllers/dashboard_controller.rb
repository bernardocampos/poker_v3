class DashboardController < ApplicationController
  def create_table
    tt = Table.new
    tt.name = params[:name]
    tt.password = params[:password]
    tt.stage = "standby"
    tt.small_blind = params[:big_blind]/2
    tt.big_blind = params[:big_blind]
    tt.buy_in = params[:buy_in]
    tt.save
    tp = Player.new
    tp.table_id = tt.id
    tp.user_id = params[:user_id]
    tp.player_number = 1
    tp.folded = true
    tp.buy_ins = 0
    tp.purse = 0
    tp.latest_bet_this_round = 0
    tp.save
  end

  def join_table
    tp = Player.new
    tp.table_id = Table.where(:name => params[:name], :password => params[:password]).id
    tp.user_id = params[:user_id]
    tp.player_number = Table.find_by(:name => params[:name]).players.last
    tp.folded = true
    tp.buy_ins = 0
    tp.purse = 0
    tp.latest_bet_this_round = 0
    tp.save
  end

  def add_user
    #code
  end

  def remove_user
    #code
  end

  def change_buy_in
    #code
  end

  def leave_table
    #code
  end



end
