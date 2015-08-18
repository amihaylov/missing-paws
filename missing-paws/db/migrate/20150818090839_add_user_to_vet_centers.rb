class AddUserToVetCenters < ActiveRecord::Migration
  def change
    add_reference :vet_centers, :user, index: true, foreign_key: true
  end
end
