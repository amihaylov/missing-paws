class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.string :name
      t.string :phone
      t.string :email
      t.string :city

      t.timestamps null: false
    end
  end
end
