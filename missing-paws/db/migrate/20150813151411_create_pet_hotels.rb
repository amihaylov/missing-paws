class CreatePetHotels < ActiveRecord::Migration
  def change
    create_table :pet_hotels do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :name
      t.string :phone
      t.string :website
      t.string :city

      t.timestamps null: false
    end
  end
end
