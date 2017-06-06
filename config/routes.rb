Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #dashboard controller actions
  get("/new_table", {:controller => "dashboard", :action => "new_table"})
  post("/create_table", {:controller => "dashboard", :action => "create_table"})
  get("/join_form", {:controller => "dashboard", :action => "join_form"})
  post("/join_table", {:controller => "dashboard", :action => "join_table"})
  get("/leave_table/:table_id", {:controller => "dashboard", :action => "leave_table"})

  root to: "dashboard#home"

  #dashboard gameplay actions

  get("/:table_id", {:controller => "gameplay", :action => "game"})
  post("/record_move/", {:controller => "gameplay", :action => "record_move"})
  get("/clear_table/:user_id/:table_id", {:controller => "gameplay", :action => "clear_table"})
  get("/to_turn/:user_id/:table_id", {:controller => "gameplay", :action => "to_turn"})
  get("/buy_in_more/:user_id/:table_id", {:controller => "gameplay", :action => "buy_in_more"})
  get("/buy_in_less/:user_id/:table_id", {:controller => "gameplay", :action => "buy_in_less"})

  #management controller actions
  get("/stats/:table_id", {:controller => "management", :action => "stats"})
  get("/deck/:table_id", {:controller => "management", :action => "deck"})


end
