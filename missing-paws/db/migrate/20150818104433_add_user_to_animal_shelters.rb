class AddUserToAnimalShelters < ActiveRecord::Migration
  def change
    add_reference :animal_shelters, :user, index: true, foreign_key: true
  end
end
