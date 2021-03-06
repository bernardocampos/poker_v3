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

url_array = [
"https://upload.wikimedia.org/wikipedia/commons/3/36/Playing_card_club_A.svg",
"https://upload.wikimedia.org/wikipedia/commons/f/f5/Playing_card_club_2.svg",
"https://upload.wikimedia.org/wikipedia/commons/6/6b/Playing_card_club_3.svg",
"https://upload.wikimedia.org/wikipedia/commons/3/3d/Playing_card_club_4.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/50/Playing_card_club_5.svg",
"https://upload.wikimedia.org/wikipedia/commons/a/a0/Playing_card_club_6.svg",
"https://upload.wikimedia.org/wikipedia/commons/4/4b/Playing_card_club_7.svg",
"https://upload.wikimedia.org/wikipedia/commons/e/eb/Playing_card_club_8.svg",
"https://upload.wikimedia.org/wikipedia/commons/2/27/Playing_card_club_9.svg",
"https://upload.wikimedia.org/wikipedia/commons/3/3e/Playing_card_club_10.svg",
"https://upload.wikimedia.org/wikipedia/commons/b/b7/Playing_card_club_J.svg",
"https://upload.wikimedia.org/wikipedia/commons/f/f2/Playing_card_club_Q.svg",
"https://upload.wikimedia.org/wikipedia/commons/2/22/Playing_card_club_K.svg",
"https://upload.wikimedia.org/wikipedia/commons/d/d3/Playing_card_diamond_A.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/59/Playing_card_diamond_2.svg",
"https://upload.wikimedia.org/wikipedia/commons/8/82/Playing_card_diamond_3.svg",
"https://upload.wikimedia.org/wikipedia/commons/2/20/Playing_card_diamond_4.svg",
"https://upload.wikimedia.org/wikipedia/commons/f/fd/Playing_card_diamond_5.svg",
"https://upload.wikimedia.org/wikipedia/commons/8/80/Playing_card_diamond_6.svg",
"https://upload.wikimedia.org/wikipedia/commons/e/e6/Playing_card_diamond_7.svg",
"https://upload.wikimedia.org/wikipedia/commons/7/78/Playing_card_diamond_8.svg",
"https://upload.wikimedia.org/wikipedia/commons/9/9e/Playing_card_diamond_9.svg",
"https://upload.wikimedia.org/wikipedia/commons/3/34/Playing_card_diamond_10.svg",
"https://upload.wikimedia.org/wikipedia/commons/a/af/Playing_card_diamond_J.svg",
"https://upload.wikimedia.org/wikipedia/commons/0/0b/Playing_card_diamond_Q.svg",
"https://upload.wikimedia.org/wikipedia/commons/7/78/Playing_card_diamond_K.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/57/Playing_card_heart_A.svg",
"https://upload.wikimedia.org/wikipedia/commons/d/d5/Playing_card_heart_2.svg",
"https://upload.wikimedia.org/wikipedia/commons/b/b6/Playing_card_heart_3.svg",
"https://upload.wikimedia.org/wikipedia/commons/a/a2/Playing_card_heart_4.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/52/Playing_card_heart_5.svg",
"https://upload.wikimedia.org/wikipedia/commons/c/cd/Playing_card_heart_6.svg",
"https://upload.wikimedia.org/wikipedia/commons/9/94/Playing_card_heart_7.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/50/Playing_card_heart_8.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/50/Playing_card_heart_9.svg",
"https://upload.wikimedia.org/wikipedia/commons/9/98/Playing_card_heart_10.svg",
"https://upload.wikimedia.org/wikipedia/commons/4/46/Playing_card_heart_J.svg",
"https://upload.wikimedia.org/wikipedia/commons/7/72/Playing_card_heart_Q.svg",
"https://upload.wikimedia.org/wikipedia/commons/d/dc/Playing_card_heart_K.svg",
"https://upload.wikimedia.org/wikipedia/commons/2/25/Playing_card_spade_A.svg",
"https://upload.wikimedia.org/wikipedia/commons/f/f2/Playing_card_spade_2.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/52/Playing_card_spade_3.svg",
"https://upload.wikimedia.org/wikipedia/commons/2/2c/Playing_card_spade_4.svg",
"https://upload.wikimedia.org/wikipedia/commons/9/94/Playing_card_spade_5.svg",
"https://upload.wikimedia.org/wikipedia/commons/d/d2/Playing_card_spade_6.svg",
"https://upload.wikimedia.org/wikipedia/commons/6/66/Playing_card_spade_7.svg",
"https://upload.wikimedia.org/wikipedia/commons/2/21/Playing_card_spade_8.svg",
"https://upload.wikimedia.org/wikipedia/commons/e/e0/Playing_card_spade_9.svg",
"https://upload.wikimedia.org/wikipedia/commons/8/87/Playing_card_spade_10.svg",
"https://upload.wikimedia.org/wikipedia/commons/b/bd/Playing_card_spade_J.svg",
"https://upload.wikimedia.org/wikipedia/commons/5/51/Playing_card_spade_Q.svg",
"https://upload.wikimedia.org/wikipedia/commons/9/9f/Playing_card_spade_K.svg"]


until Deck.count == 52 do
new_card = Deck.new
new_card.card = cards_array[counter]
new_card.image_url = url_array[counter]
new_card.save
counter = counter + 1
end
