class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :category
      t.string :title
      t.text :picture
      t.text :text

      t.timestamps null: false
    end
  end
end
