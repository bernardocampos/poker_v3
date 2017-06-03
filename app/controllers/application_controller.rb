class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :next_player

  def self.next_stage
    #### "go to next game stage" command
    #create array of all game stages
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
    stage = Table.find(table).stage
  end

  helper_method :next_player

  def self.next_player
    #### "go to next player" command
    #create array of players still in game
    players_not_folded = []
    table = params[:id]
    x = Player.where(:table_id => table, :folded => false).count
    y = 1
    until players_not_folded.count == x do
      players_not_folded.push(Player.where(:table_id => table, :folded => false).find(y).player_number)
      y = y+1
    end

    #find where this player is in the array
    active_player_index = players_not_folded.index(active_player)
    #update active player
    temp_table = Table.find(table)
    if active_player_index == players_not_folded.count-1
      temp_table.active_player = players_not_folded[0]
    else
      temp_table.active_player = players_not_folded[active_player_index+1]
    end
    temp_table.save
    active_player = Table.find(table).active_player

  end

end
