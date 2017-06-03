class GameplayController < ApplicationController
  def game

    table = params[:table_id]
    user = params[:user_id]
    this_player = Player.find_by(:user_id => user, :table_id => table).player_number #maybe redundant, given @player below


    active_player = Table.find(table).active_player
    button_holder = Table.find(table).button_holder
    stage = Table.find(table).stage

    @table = Table.find(table)
    @player = Player.where(:user_id => user, :table_id => table)


    if stage == "deal_cards" #this shouldn't be here? maybe add an invisible player which triggers card deals, etc.
      load_variables
      # place two cards in each players' hands + flop, river and turn
      deck_shuffle = (1..52).to_a.sample(17)

      # a = 0
      # b = 1
      # until a == 11 do
      #   temp_player = Player.find_by(:table_id => table, :player_number => b)
      #
      #   temp_player.c1 = Deck.find(deck_shuffle[a]).card
      #   a = a+1
      #   logger.debug "a = #{a}"
      #   temp_player.c2 = Deck.find(deck_shuffle[a]).card
      #   a = a+1
      #   b = b+1
      #   temp_player.save
      # end

      this_table = Table.find(table)
      this_table.p1c1 = Deck.find(deck_shuffle[0]).card
      this_table.p1c2 = Deck.find(deck_shuffle[1]).card
      this_table.p2c1 = Deck.find(deck_shuffle[2]).card
      this_table.p2c2 = Deck.find(deck_shuffle[3]).card
      this_table.p3c1 = Deck.find(deck_shuffle[4]).card
      this_table.p3c2 = Deck.find(deck_shuffle[5]).card
      this_table.p4c1 = Deck.find(deck_shuffle[6]).card
      this_table.p4c2 = Deck.find(deck_shuffle[7]).card
      this_table.p5c1 = Deck.find(deck_shuffle[8]).card
      this_table.p5c2 = Deck.find(deck_shuffle[9]).card
      this_table.p6c1 = Deck.find(deck_shuffle[10]).card
      this_table.p6c2 = Deck.find(deck_shuffle[11]).card
      this_table.flop1 = Deck.find(deck_shuffle[12]).card
      this_table.flop2 = Deck.find(deck_shuffle[13]).card
      this_table.flop3 = Deck.find(deck_shuffle[14]).card
      this_table.river = Deck.find(deck_shuffle[15]).card
      this_table.turn = Deck.find(deck_shuffle[16]).card
      this_table.save

      next_stage
      ######## need to understand how this is working. I tried creating a method where I would define all the variables I
      ## would need to work with and then just call on that method within other methods, but it didn't work. why?

      render("gameplay.html.erb")

    else
      load_variables
      render("gameplay.html.erb")

    end


  end

  def load_variables
    table = params[:table_id]
    user = params[:user_id]
    @table = Table.find_by(:id => params[:table_id])
    @deck = Deck.all
    @player = Player.where(:table_id => params[:table_id])
    @user = User.all
    @this_player = Player.find_by(:user_id => params[:user_id], :table_id => params[:table_id]).player_number
    # @card1 = Table.p
    # @card2 =
  end

  def record_move
    load_variables
    table = params[:table_id] #can i create an action that will load the necessary variables for me every time? is it a good idea to do so?
    user = params[:user_id]
    temp_player = Player.find_by(:table_id => table, :user_id => user) ####### method .folded not working on this class, but does so in terminal


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


    temp_table = Table.find(table)
    temp_table.pot = temp_table.pot + temp_player.latest_bet_this_round

    temp_player.save
    temp_table.save

    next_player

    redirect_to("/#{user}/#{table}")

  end

  def players_not_folded
    #create array of players still in game
    players_not_folded = []
    table = params[:table_id]
    x = Player.where(:table_id => table, :folded => false).count
    y = 1
    until players_not_folded.count == x do
      players_not_folded.push(Player.where(:table_id => table, :folded => false).first(y).last.player_number)
      y = y+1
    end
    players_not_folded
  end

  def next_player
    #### "go to next player" command

    players_not_folded

    #find where active player is in the array
    active_player = Table.find(params[:table_id]).active_player
    active_player_index = players_not_folded.index(active_player)

    #update active player
    temp_table = Table.find(params[:table_id])
    if active_player_index == players_not_folded.count-1 ## if latest active player was final player
      finalize_stage
    else
      temp_table.active_player = players_not_folded[active_player_index+1]
    end
    temp_table.save
    active_player = Table.find(params[:table_id]).active_player

  end

  def finalize_stage
    # make active player first unfolded player
    load_variables
    temp_table = Table.find(params[:table_id])
    temp_table.active_player = players_not_folded[0]
    #clear latest_bet_this_round for all players
    @player.each do |player|
      temp_player = player
      temp_player.latest_bet_this_round = 0
      temp_player.save
    end

    next_stage
  end

  def next_stage
    #### "go to next game stage" command
    #create array of all game stages
    table = params[:table_id]
    stage = Table.find(table).stage
    game_stages = ["deal_cards", "blinds", "flop", "river", "turn"]
    #find where this stage is in the array
    stage_index = game_stages.index(stage)
    #update stage
    temp_table = Table.find(table)
    if stage_index == game_stages.count-1
      temp_table.stage = game_stages[0]
    else
      temp_table.stage = game_stages[stage_index+1]
    end
    temp_table.save
    stage = Table.find(table).stage #why did I put this here?
  end

  # def clear
  #   temp_table = Table()
  # end

end
