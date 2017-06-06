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
    @table.buy_in = params[:buy_in]
    @table.pot = 0
    @table.save
    @tp = Player.new
    @tp.table_id = @table.id
    @tp.user_id = current_user.id
    @tp.player_number = 1            #adjust this
    @tp.folded = true
    @tp.buy_ins = 0
    @tp.purse = 0
    @tp.latest_bet_this_round = 0
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
      @player.table_id = params[:id]
      @player.user_id = current_user.id
      @player.player_number = Table.find(params[:id]).players.length + 1
      @player.folded = true
      @player.buy_ins = 0
      @player.purse = 0
      @player.latest_bet_this_round = 0
      @player.save

      save_status = @player.save

      if save_status == true
        redirect_to("/", :notice => "Table joined successfully.")

      else
        render("dashboard/join_table.html.erb")
      end

    else render("dashboard/join_table.html.erb", :notice => "Incorrect table/password combination")
    end

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
    player = Player.find_by(:user_id => current_user.id, :table_id => params[:table_id])
    player.destroy
    redirect_to("/")
  end



end
