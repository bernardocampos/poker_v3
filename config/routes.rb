Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #dashboard controller actions
  get("/new_table", {:controller => "dashboard", :action => "new_table"})
  post("/create_table", {:controller => "dashboard", :action => "create_table"})
  get("/join_form", {:controller => "dashboard", :action => "join_form"})
  post("/join_table", {:controller => "dashboard", :action => "join_table"})
  post("/leave_table/", {:controller => "dashboard", :action => "leave_table"})
  get("/leave_confirmation/:table_id", {:controller => "dashboard", :action => "leave_confirmation"})
  post("/reset_table/", {:controller => "dashboard", :action => "reset_table"})
  get("/reset_confirmation/:table_id", {:controller => "dashboard", :action => "reset_confirmation"})

  root to: "dashboard#home"

  #gameplay controller actions

  get("/:table_id", {:controller => "gameplay", :action => "game"})
  post("/record_move/", {:controller => "gameplay", :action => "record_move"})
  get("/to_turn/:user_id/:table_id", {:controller => "gameplay", :action => "to_turn"})
  post("/buy_in_more/:table_id", {:controller => "gameplay", :action => "buy_in_more"})
  post("/buy_in_less/:table_id", {:controller => "gameplay", :action => "buy_in_less"})

  #management controller actions
  get("/stats/:table_id", {:controller => "management", :action => "stats"})
  get("/deck/", {:controller => "management", :action => "deck"})


end
