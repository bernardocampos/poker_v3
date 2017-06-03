class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :card
      t.string :image_url

      t.timestamps
    end
  end
end
