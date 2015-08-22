class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :image
      t.text :category

      t.timestamps null: false
    end
  end
end
