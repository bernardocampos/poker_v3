# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

####
Deck of cards:
rails generate model deck card:string image_url:string
rails db:migrate

counter = 0

cards_array =
["Ac", "2c", "3c", "4c", "5c", "6c", "7c", "8c", "9c", "Tc", "Jc", "Qc", "Kc",
 "Ad", "2d", "3d", "4d", "5d", "6d", "7d", "8d", "9d", "Td", "Jd", "Qd", "Kd",
 "Ah", "2h", "3h", "4h", "5h", "6h", "7h", "8h", "9h", "Th", "Jh", "Qh", "Kh",
 "As", "2s", "3s", "4s", "5s", "6s", "7s", "8s", "9s", "Ts", "Js", "Qs", "Ks"]

url_array = ["https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Playing_card_club_A.svg/200px-Playing_card_club_A.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Playing_card_club_2.svg/200px-Playing_card_club_2.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Playing_card_club_3.svg/200px-Playing_card_club_3.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Playing_card_club_4.svg/200px-Playing_card_club_4.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Playing_card_club_5.svg/200px-Playing_card_club_5.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Playing_card_club_6.svg/200px-Playing_card_club_6.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Playing_card_club_7.svg/200px-Playing_card_club_7.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Playing_card_club_8.svg/200px-Playing_card_club_8.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Playing_card_club_9.svg/200px-Playing_card_club_9.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Playing_card_club_10.svg/200px-Playing_card_club_10.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Playing_card_club_J.svg/200px-Playing_card_club_J.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Playing_card_club_Q.svg/200px-Playing_card_club_Q.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Playing_card_club_K.svg/200px-Playing_card_club_K.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Playing_card_club_A.svg/200px-Playing_card_club_A.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Playing_card_club_2.svg/200px-Playing_card_club_2.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Playing_card_club_3.svg/200px-Playing_card_club_3.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Playing_card_club_4.svg/200px-Playing_card_club_4.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Playing_card_club_5.svg/200px-Playing_card_club_5.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Playing_card_club_6.svg/200px-Playing_card_club_6.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Playing_card_club_7.svg/200px-Playing_card_club_7.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Playing_card_club_8.svg/200px-Playing_card_club_8.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Playing_card_club_9.svg/200px-Playing_card_club_9.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Playing_card_club_10.svg/200px-Playing_card_club_10.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Playing_card_club_J.svg/200px-Playing_card_club_J.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Playing_card_club_Q.svg/200px-Playing_card_club_Q.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Playing_card_club_K.svg/200px-Playing_card_club_K.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Playing_card_heart_A.svg/200px-Playing_card_heart_A.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Playing_card_heart_2.svg/200px-Playing_card_heart_2.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Playing_card_heart_3.svg/200px-Playing_card_heart_3.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Playing_card_heart_4.svg/200px-Playing_card_heart_4.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Playing_card_heart_5.svg/200px-Playing_card_heart_5.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Playing_card_heart_6.svg/200px-Playing_card_heart_6.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Playing_card_heart_7.svg/200px-Playing_card_heart_7.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Playing_card_heart_8.svg/200px-Playing_card_heart_8.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Playing_card_heart_9.svg/200px-Playing_card_heart_9.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Playing_card_heart_10.svg/200px-Playing_card_heart_10.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Playing_card_heart_J.svg/200px-Playing_card_heart_J.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Playing_card_heart_Q.svg/200px-Playing_card_heart_Q.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Playing_card_heart_K.svg/200px-Playing_card_heart_K.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Playing_card_spade_A.svg/200px-Playing_card_spade_A.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Playing_card_spade_2.svg/200px-Playing_card_spade_2.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Playing_card_spade_3.svg/200px-Playing_card_spade_3.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Playing_card_spade_4.svg/200px-Playing_card_spade_4.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Playing_card_spade_5.svg/200px-Playing_card_spade_5.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Playing_card_spade_6.svg/200px-Playing_card_spade_6.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Playing_card_spade_7.svg/200px-Playing_card_spade_7.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Playing_card_spade_8.svg/200px-Playing_card_spade_8.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Playing_card_spade_9.svg/200px-Playing_card_spade_9.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Playing_card_spade_10.svg/200px-Playing_card_spade_10.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Playing_card_spade_J.svg/200px-Playing_card_spade_J.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Playing_card_spade_Q.svg/200px-Playing_card_spade_Q.svg.png",
"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Playing_card_spade_K.svg/200px-Playing_card_spade_K.svg.png"]


until Deck.count == 52 do
new_card = Deck.new
new_card.card = cards_array[counter]
new_card.image_url = url_array[counter]
new_card.save
counter = counter + 1
end

#####
Users model:

rails generate model users secret_id:string username:string
rails db:migrate

counter = 0
secrets = ["abc", "def", "ghi", "jkl", "mno", "pqr"]
usernames = ["Little Lamb", "Cowboy Wayne", "Spatzs Boy", "Dido Daddy", "Dr Boosk", "The Brains"]

until User.count == 6 do
new_user = User.new
new_user.secret_id = secrets[counter]
new_user.username = usernames[counter]
new_user.save
counter = counter + 1
end

###
Tables:
rails generate model tables pot:integer stage:string button_holder:integer active_player:integer p1c1:string p1c2:string p2c1:string p2c2:string p3c1:string p3c2:string p4c1:string p4c2:string p5c1:string p5c2:string p6c1:string p6c2:string flop1:string flop2:string flop3:string river:string turn:string small_blind:integer big_blind:integer

rails db:migrate

table = Table.new
table.pot = 0
table.stage = "deal_cards"
table.button_holder = 1
table.active_player = 1
table.small_blind = 50
table.big_blind = 100
table.save

###
Deck shuffle
deck_shuffle = (1..52).to_a.sample(17)

this_table = Table.find(1)
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


###
Players:
rails generate model players table_id:integer user_id:integer player_number:integer folded:boolean buy_ins:integer purse:integer latest_bet_this_round:integer

rails db:migrate

counter = 1

until Player.count == 6 do

player = Player.new
player.table_id = 1
player.user_id = counter
player.player_number = counter
player.folded = false
player.buy_ins = 1
player.purse = 2000
player.latest_bet_this_round = 0
player.save
counter = counter+1
end

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
