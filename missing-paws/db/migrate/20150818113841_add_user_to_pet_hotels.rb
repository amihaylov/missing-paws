class AddUserToPetHotels < ActiveRecord::Migration
  def change
    add_reference :pet_hotels, :user, index: true, foreign_key: true
  end
end
