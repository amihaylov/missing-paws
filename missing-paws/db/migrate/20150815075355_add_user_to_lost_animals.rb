class AddUserToLostAnimals < ActiveRecord::Migration
  def change
    add_reference :lost_animals, :user, index: true, foreign_key: true
  end
end
