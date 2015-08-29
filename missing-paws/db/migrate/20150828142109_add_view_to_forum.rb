class AddViewToForum < ActiveRecord::Migration
  def change
    add_column :forums, :views, :integer
  end
end
