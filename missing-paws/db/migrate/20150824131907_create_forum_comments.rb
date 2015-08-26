class CreateForumComments < ActiveRecord::Migration
  def change
    create_table :forum_comments do |t|
      t.text :comment
      t.references :user, index: true, foreign_key: true
      t.references :forum, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
