class GameplayController < ApplicationController #first attempt at making code way cleaner.
  #problem identified with:
  #temp player
  #temp table
  
  def game
    load_variables
    if @table.stage == "deal_cards" #this shouldn't be here? maybe add an invisible player which triggers card deals, etc.
      deal_cards
      next_stage
      render("gameplay.html.erb")
    else
      load_variables
      render("gameplay.html.erb")
    end
  end

  def clear_bets
    #clear latest_bet_this_round for all players
    load_variables
    @player.each do |player|
      temp_player = player
      temp_player.latest_bet_this_round = 0
      temp_player.save
    end
  end

  def deal_cards
    load_variables
    deck_shuffle = (1..52).to_a.sample(17)

    # a = 0
    # b = 1
    # until a == 11 do
    #   temp_player = Player.find_by(:table_id => @table_id, :player_number => b)
    #
    #   temp_player.c1 = Deck.find(deck_shuffle[a]).card
    #   a = a+1
    #   logger.debug "a = #{a}"
    #   temp_player.c2 = Deck.find(deck_shuffle[a]).card
    #   a = a+1
    #   b = b+1
    #   temp_player.save
    # end

    ttable = @table
    ttable.p1c1 = Deck.find(deck_shuffle[0]).card
    ttable.p1c2 = Deck.find(deck_shuffle[1]).card
    ttable.p2c1 = Deck.find(deck_shuffle[2]).card
    ttable.p2c2 = Deck.find(deck_shuffle[3]).card
    ttable.p3c1 = Deck.find(deck_shuffle[4]).card
    ttable.p3c2 = Deck.find(deck_shuffle[5]).card
    ttable.p4c1 = Deck.find(deck_shuffle[6]).card
    ttable.p4c2 = Deck.find(deck_shuffle[7]).card
    ttable.p5c1 = Deck.find(deck_shuffle[8]).card
    ttable.p5c2 = Deck.find(deck_shuffle[9]).card
    ttable.p6c1 = Deck.find(deck_shuffle[10]).card
    ttable.p6c2 = Deck.find(deck_shuffle[11]).card
    ttable.flop1 = Deck.find(deck_shuffle[12]).card
    ttable.flop2 = Deck.find(deck_shuffle[13]).card
    ttable.flop3 = Deck.find(deck_shuffle[14]).card
    ttable.river = Deck.find(deck_shuffle[15]).card
    ttable.turn = Deck.find(deck_shuffle[16]).card
    ttable.save
  end

  def finalize_stage
    # make active player first unfolded player
    temp_table
    players_not_folded
    temp_table.active_player = players_not_folded[0]

    clear_bets

    next_stage
  end

  def load_variables
    @table_id = params[:table_id]
    @user_id = params[:user_id]
    @table = Table.find_by(:id => @table_id)
    @deck = Deck.all
    @player = Player.where(:table_id => @table_id)
    @user = User.all
    @this_player = Player.find_by(:user_id => @user_id, :table_id => @table_id).player_number

  end

  def next_player
    load_variables
    players_not_folded

    #find where active player is in the array
    active_player_index = players_not_folded.index(@table.active_player)

    #update active player
    temp_table

    if active_player_index + 1 == players_not_folded.count ## if latest active player was final player
      finalize_stage  #this logic needs to be updated later. if someone raises this doesn;t apply
      ############################this is where most of the logic needs to go, perhaps in a separate action
    else
      temp_table.active_player = players_not_folded[active_player_index+1]
      temp_table.save
    end

  end

  def next_stage
    #### "go to next game stage" command
    #create array of all game stages
    load_variables
    game_stages = ["deal_cards", "blinds", "flop", "river", "turn"]
    #find where this stage is in the array
    stage_index = game_stages.index(stage)
    #update stage
    temp_table = Table.find(@table_id)
    if stage_index == game_stages.count-1
      temp_table.stage = game_stages[0]
    else
      temp_table.stage = game_stages[stage_index+1]
    end
    temp_table.save
    stage = Table.find(@table_id).stage #why did I put this here?
  end

  def players_not_folded
    #create array of players still in game
    load_variables
    players_not_folded = []
    x = Player.where(:table_id => @table_id, :folded => false).count
    y = 1
    until players_not_folded.count == x do
      players_not_folded.push(Player.where(:table_id => @table_id, :folded => false).first(y).last.player_number)
      y = y+1
    end
    players_not_folded
  end

  def record_move
    load_variables
    temp_player

    if params[:move] == "fold"
      temp_player.folded = true
    else temp_player.folded = false
    end

    temp_player.latest_bet_this_round =
    if params[:move] == "bet"
      params[:bet_amount]
    else 0
    end

    temp_player.purse = temp_player.purse - temp_player.latest_bet_this_round

    temp_table
    temp_table.pot = temp_table.pot + temp_player.latest_bet_this_round

    temp_player.save
    temp_table.save

    next_player

    redirect_to("/#{@user_id}/#{@table_id}")
    # render("gameplay.html.erb")

  end

  def temp_player
    load_variables
    temp_player = Player.find_by(:table_id => @table_id, :user_id => @user_id)
  end

  def temp_table
    load_variables
    temp_table = Table.find_by(:id => @table_id)
  end

end
