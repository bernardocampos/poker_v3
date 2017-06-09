class ManagementController < ApplicationController
  def stats
    @table = Table.find(params[:table_id])
    @player = Player.where(:table_id => params[:table_id])

  end

  def deck
    @deck = Deck.all
    render("deck.html.erb")
  end

  def update_deck
    tc = Deck.find_by(:card => params[:card])
    tc.card = params[:card]
    tc.image_url = params[:image_url]
    tc.save
    redirect_to("/deck", :notice => "image updated successfully")
  end

end
