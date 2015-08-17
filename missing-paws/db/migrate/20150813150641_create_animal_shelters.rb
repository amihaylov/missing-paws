class CreateAnimalShelters < ActiveRecord::Migration
  def change
    create_table :animal_shelters do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :phone
      t.string :website
      t.string :city

      t.timestamps null: false
    end
  end
end
