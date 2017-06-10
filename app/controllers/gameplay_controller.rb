class GameplayController < ApplicationController
  def game
    load_variables
    players_not_folded
    if @table.stage == "standby"
      if @player.count > 1
        finalize_round
        redirect_to("/#{@table_id}", :notice => "#{@notices}")
      else
        render("gameplay.html.erb")
      end
    elsif @table.stage == "deal_cards"
      deal_cards
      finalize_stage
      ## next_stage
      redirect_to("/#{@table_id}", :notice => "#{@notices}")
    elsif @table.stage == "pay_winner" #or everyone folded
      pay_winner
      finalize_round
      winner_notices
      redirect_to("/#{@table_id}", :notice => "#{@notices}")
    elsif @table.stage == "blinds"
      winner_notices
      @notices
      render("gameplay.html.erb")
    elsif players_not_folded.length == 1
      # pay_winner
      # finalize_round
      # winner_notices
      # redirect_to("/#{@table_id}", :notice => "#{@notices}")
      temp_table = @table
      temp_table.stage = "pay_winner"
      temp_table.save
      # render("gameplay.html.erb")
      redirect_to("/#{@table_id}")
    else
      render("gameplay.html.erb")
    end
  end

  def buy_in_more
    load_variables
    tp = @player.find_by(:user_id => @user_id)
    tp.buy_ins = tp.buy_ins+1
    tp.purse = tp.purse + @table.buy_in
    tp.save
    redirect_to("/#{@table_id}", :alert => "I hope you know what you're doing")
  end

  def buy_in_less
    load_variables
    tp = @player.find_by(:user_id => @user_id)
    if tp.purse >= @table.buy_in
      tp.buy_ins = tp.buy_ins-1
      tp.purse = tp.purse - @table.buy_in
      tp.save
      @notice = "Smart move. Quit while you're ahead..."
    else @alert = "Nice try, but you're too poor for that"
    end

    redirect_to("/#{@table_id}", :notice => "#{@notice}")
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
    players_not_folded
    # place two cards in each players' hands + flop, river and turn
    z = players_not_folded.count * 2
    deck_shuffle = ((Deck.first.id)..(Deck.last.id)).to_a.sample(z+5)

    a = 5
    b = 0
    until a == z+5 do
      temp_player = Player.find_by(:table_id => @table_id, :player_number => players_not_folded[b])

      temp_player.c1 = Deck.find(deck_shuffle[a]).card
      a = a+1
      # # logger.debug "a = #{a}"
      temp_player.c2 = Deck.find(deck_shuffle[a]).card
      a = a+1
      b = b+1
      temp_player.save
    end

    this_table = @table
    this_table.flop1 = Deck.find(deck_shuffle[0]).card
    this_table.flop2 = Deck.find(deck_shuffle[1]).card
    this_table.flop3 = Deck.find(deck_shuffle[2]).card
    this_table.river = Deck.find(deck_shuffle[3]).card
    this_table.turn = Deck.find(deck_shuffle[4]).card

    # this_table.p1c1 = Deck.find(deck_shuffle[5]).card
    # this_table.p1c2 = Deck.find(deck_shuffle[6]).card
    # this_table.p2c1 = Deck.find(deck_shuffle[7]).card
    # this_table.p2c2 = Deck.find(deck_shuffle[8]).card
    # this_table.p3c1 = Deck.find(deck_shuffle[9]).card
    # this_table.p3c2 = Deck.find(deck_shuffle[10]).card
    # this_table.p4c1 = Deck.find(deck_shuffle[11]).card
    # this_table.p4c2 = Deck.find(deck_shuffle[12]).card
    # this_table.p5c1 = Deck.find(deck_shuffle[13]).card
    # this_table.p5c2 = Deck.find(deck_shuffle[14]).card
    # this_table.p6c1 = Deck.find(deck_shuffle[15]).card
    # this_table.p6c2 = Deck.find(deck_shuffle[16]).card

    this_table.save
  end

  def finalize_round
    load_variables
    record_to_leaderboard
    @player = Player.where(:table_id => params[:table_id])
    @player.each do |player|
      tp = player
      if tp.purse > 0
        tp.folded = false
      else
        tp.folded = true
      end
      tp.latest_bet_this_round = 0
      tp.save
    end

    @table = Table.find(params[:table_id])
    @table.pot = 0
    @table.min_bet = @table.small_blind
    @table.stage = "deal_cards"
    @table.save                               ## FOR SOME REASON IT WASN'T WORKING WITHOUT THIS

    pnf = players_not_folded                  ## FOR SOME REASON IT WASN'T WORKING WITHOUT THIS (besides the obvious)

    #find where button holder is in the array of non-folded players
    button_holder_index = pnf.index(@table.button_holder)

    # update button holder
    @table = Table.find(params[:table_id])    ## FOR SOME REASON IT WASN'T WORKING WITHOUT THIS
    if @table.button_holder == pnf.last
      @table.button_holder = pnf[0]
    else
      @table.button_holder = pnf[button_holder_index+1]
    end

    # update first active player for next round
    carousel = pnf
    carousel = carousel.concat(carousel)
    if carousel.index(@table.button_holder) == nil
      @table.active_player = carousel[0]
    else
      @table.active_player = carousel[carousel.index(@table.button_holder)+1]
    end

    @table.save
  end

  def finalize_stage
    # make active player first unfolded player
    load_variables

    temp_table = Table.find(params[:table_id])

    temp_table.active_player =
    if players_not_folded.select{|x| x > @table.button_holder}.count > 0
      players_not_folded.select{|x| x > @table.button_holder}.min
    else players_not_folded.min
    end

    temp_table.save

    clear_bets

    next_stage
  end

  def load_variables
    @table_id = params[:table_id]
    @user_id = current_user.id
    @table = Table.find_by(:id => @table_id)
    @deck = Deck.all
    @player = Player.where(:table_id => @table_id)
    @user = User.all
    @this_player =
    if @table.players.find_by(:user_id => current_user.id) != nil
      @table.players.find_by(:user_id => current_user.id).player_number
    else "visitor"
    end

  end

  def next_player
    load_variables
    players_not_folded

    #find where active player is in the array
    active_player_index = players_not_folded.index(@table.active_player)

    #update active player

    if
      if players_not_folded.select{|x|x <= @table.button_holder}.count>0 #if there are active players <= button player
        @table.active_player == players_not_folded.select{|x|x <= @table.button_holder}.max #does active player equal greatest non-folded player <= button player?
      else @table.active_player == players_not_folded.max #does active player equal greatest non-folded player?
      end
      #this logic needs to be updated later. if someone raises this doesn;t apply
      ############################this is where a large chunk of the logic goes, perhaps in a separate action
      finalize_stage
    else
      temp_table = Table.find(params[:table_id])
      temp_table.active_player =
      if @table.active_player == players_not_folded.max
        players_not_folded[0]
      else players_not_folded[active_player_index+1]
      end
      temp_table.save
    end

  end

  def next_stage
    #### "go to next game stage" command
    #create array of all game stages
    load_variables
    game_stages = ["deal_cards", "blinds", "flop", "river", "turn", "pay_winner"]
    #find where this stage is in the array
    stage_index = game_stages.index(@table.stage)
    #update stage
    temp_table = Table.find(@table_id)
    if stage_index == game_stages.count-1
      temp_table.stage = game_stages[0]
    else
      temp_table.stage = game_stages[stage_index+1]
    end
    temp_table.save
  end

  def pay_winner
    load_variables
    players_not_folded

    if players_not_folded.length == 1
      winners = [players_not_folded[0]]
      winnings = [@table.pot]
      winning_hands = []

      winner = @player.find_by(:player_number => winners)
      winner.purse = winner.purse + @table.pot
      winner.save

    else

      table_cards = [@table.flop1, @table.flop2, @table.flop3, @table.river, @table.turn]

      hands = []
      players_not_folded.each do |player|
        hole_cards = [@player.find_by(:player_number => player).c1, @player.find_by(:player_number => player).c2]
        hand = PokerHand.new(hole_cards.concat table_cards)
        hands.push(hand)
      end

      winners = []
      winners.push(players_not_folded[hands.index(hands.sort.reverse[0])])

      #allows for more than one winner if there is a tie
      x = 1
      until x == players_not_folded.length-1
        if hands.sort.reverse[0] == hands.sort.reverse[x]
          winners.push(players_not_folded[hands.index(hands.sort.reverse[x])])
        end
        x = x +1
      end

      winnings = []

      winners.each do |winner|
        @winner = @player.find_by(:player_number => winner)
        @winner.purse = @winner.purse + @table.pot / winners.length
        winnings.push(@table.pot / winners.length)
        @winner.save
      end


      winning_hands = []
      winners.each do |w|
        winning_hands.push(hands[players_not_folded.index(w)])
      end
    end

    tt = @table
    tt.winners = winners
    tt.winnings = winnings
    tt.winning_hands = winning_hands
    tt.save

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
    max_bet = [@table.min_bet,@table.pot].max

    if params[:move] == "bet" && (params[:bet_amount].to_i > max_bet || params[:bet_amount].to_i < @table.min_bet)
      redirect_to("/#{@table_id}", :alert => "Bet must be between #{@table.min_bet} and #{max_bet}. You can also fold or check (if available)")
    else

      temp_player = Player.find_by(:table_id => @table_id, :user_id => @user_id)

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

      temp_table = Table.find_by(:id => @table_id)
      temp_table.pot = temp_table.pot + temp_player.latest_bet_this_round
      temp_table.min_bet  = [params[:bet_amount].to_i, @table.small_blind].max

      next_player # this has to be in a specific place such that downstream commands will work (which
      #requires current player to not fold yet)

      temp_player.save
      temp_table.save

      redirect_to("/#{@table_id}")

    end
  end

  def record_to_leaderboard
    load_variables
    pnf = players_not_folded

    table_cards = [@table.flop1, @table.flop2, @table.flop3, @table.river, @table.turn]
    @player.each do |player|
      if @player.find_by(:player_number => player.player_number).c1 != nil
        tr = Round.new
        tr.user_id = player.user.id
        tr.table_id = @table.id
        tr.folded = player.folded
        hole_cards =
        [@player.find_by(:player_number => player.player_number).c1, @player.find_by(:player_number => player.player_number).c2]
        hand = PokerHand.new(hole_cards.concat table_cards)
        tr.cards = hand.score
        tr.hand = hand.rank

        if @table.winners.index(player.player_number) != nil
          tr.won = true
        else
          tr.won = false
        end

        if @table.winners.index(player.player_number) != nil && @table.winners.count == 1
          tr.lone_survivor = true
        else
          tr.lone_survivor = false
        end
        tr.save
      end

    end
  end

  def to_turn

    @table = Table.find(params[:table_id])
    @table.pot = 0
    @table.stage = "turn"
    @table.button_holder = @table.players.count
    @table.active_player = 1 ##########
    @table.save

    @player = Player.where(:table_id => params[:table_id])
    @player.each do |player|
      tp = player
      tp.purse = 2000
      tp.folded = false
      tp.latest_bet_this_round = 0
      tp.buy_ins = 1
      tp.save
    end
    redirect_to("/#{@table_id}")

  end
  def winner_notices
    load_variables
    notices=[]
    a = 0
    if @table.winning_hands[0].class == "nothing yet".class
      # notices.push("#{@player.find_by(:player_number => @table.winners[a]).user.username} didn't give up and won #{@table.winnings[a]} for their courage")
      notices.push("Enjoy the game!")
    elsif @table.winning_hands == []
      notices.push("Last round's winner: #{@player.find_by(:player_number => @table.winners[a]).user.username} was the lone survivor and won #{@table.winnings[a]}")
    else
      until a > @table.winners.length-1 do
        notices.push("Last round's winners: #{@player.find_by(:player_number => @table.winners[a]).user.username} wins #{@table.winnings[a]} with a #{@table.winning_hands[a].rank} (#{@table.winning_hands[a].score[1]})")
        a=a+1
      end
    end
    @notices = notices
  end
end
