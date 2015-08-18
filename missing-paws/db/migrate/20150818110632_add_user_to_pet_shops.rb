class AddUserToPetShops < ActiveRecord::Migration
  def change
    add_reference :pet_shops, :user, index: true, foreign_key: true
  end
end
