class ManagementController < ApplicationController
  def stats
    @table = Table.find(params[:table_id])
    @player = Player.where(:table_id => params[:table_id])

  end

  def deck
    @deck = Deck.first
    render("deck.html.erb")
  end

end
