class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :image_url
      t.string :url
      t.integer :rating
      t.string :display_address
      t.string :display_phone
      t.belongs_to :user, foreign_key: true
    end
  end
end
