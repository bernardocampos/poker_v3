class DashboardController < ApplicationController
  def home
    if current_user != nil
      @table = current_user.tables
    else
      @table = Table.all
    end
    @player = Player.all
    @user = User.all

  end

  def new_table
    @table = Table.new
    @player = Player.new
  end

  def create_table
    @table = Table.new
    @table.name = params[:name]
    @table.password = params[:password]
    @table.stage = "standby"
    @table.small_blind = params[:big_blind].to_i/2
    @table.big_blind = params[:big_blind]
    @table.button_holder = 1
    @table.buy_in = params[:buy_in]
    @table.pot = 0
    @table.winning_hands = [nil]
    @table.save
    @tp = Player.new
    @tp.table_id = @table.id
    @tp.user_id = current_user.id
    @tp.player_number = 1            #adjust this
    @tp.folded = true
    @tp.buy_ins = 1
    @tp.purse = @table.buy_in
    @tp.latest_bet_this_round = nil
    @tp.save

    save_status = @table.save

    if save_status == true
      redirect_to("/", :notice => "Table created successfully.")

    else
      render("dashboard/new_table.html.erb")
    end

  end

  def join_form
    @player = Player.new
  end

  def join_table
    @player = Player.new
    if Table.find_by(:id => params[:id], :password => params[:password]) != nil
      @table = Table.find_by(:id => params[:id], :password => params[:password])
      @player.table_id = params[:id]
      @player.user_id = current_user.id
      @player.player_number = @table.players.count + 1
      @player.folded = true
      @player.buy_ins = 1
      @player.purse = @table.buy_in
      @player.latest_bet_this_round = nil
      @player.save

      save_status = @player.save

      if save_status == true
        redirect_to("/", :notice => "Table joined successfully.")

      else
        render("dashboard/join_table.html.erb")
      end

    else redirect_to("/", :alert => "Inexistent table or incorrect table/password combination")
    end

  end
  
  def invite
    render("dashboard/invite.html.erb")
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

  def leave_confirmation
    if Player.find_by(:table_id => params[:table_id], :user_id => current_user.id) != nil
      @table = Table.find(params[:table_id])
    else
      redirect_to("/", :alert => "You're not a player in that table")
    end
  end

  def leave_table
    player = Player.find_by(:user_id => current_user.id, :table_id => params[:table_id])
    player.destroy
    redirect_to("/")
  end

  def reset_confirmation
    if Player.find_by(:table_id => params[:table_id], :user_id => current_user.id, :player_number => 1) != nil
      @table = Table.find(params[:table_id])
    else
      redirect_to("/", :alert => "Only the user who created the table is allowed to do that")
    end

  end
  def reset_table
    if Player.find_by(:table_id => params[:table_id], :user_id => current_user.id, :player_number => 1) != nil
      @table = Table.find(params[:table_id])
      @table.pot = 0
      @table.stage = "deal_cards"
      @table.min_bet = @table.small_blind
      @table.button_holder = @table.players.count
      @table.winning_hands = [nil]
      @table.active_player = 1 ##########
      @table.save

      @player = Player.where(:table_id => params[:table_id])
      @player.each do |player|
        tp = player
        tp.purse = @table.buy_in
        tp.folded = false
        tp.latest_bet_this_round = nil
        tp.buy_ins = 1
        tp.save
      end
      redirect_to("/#{@table_id}", :notice => "Table reset successfully. You may now go to the table and start the game.")
      # render("gameplay.html.erb")
    else redirect_to("/", :alert => "Only the user who created the table is allowed to do that")
    end
  end

  def leaderboard
    @round = Round.all
    relevant_players = @round.uniq.pluck(:user_id)
    @user = User.where(id: relevant_players)

  end
end
