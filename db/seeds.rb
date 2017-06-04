# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Deck of cards

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


# create Users
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

# populate table stats
table = Table.new
table.pot = 0
table.stage = "deal_cards"
table.button_holder = 1
table.active_player = 1
table.small_blind = 50
table.big_blind = 100
table.save

#players
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
