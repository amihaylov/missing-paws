class AddAttachmentImageToVetCenters < ActiveRecord::Migration
  def self.up
    change_table :vet_centers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :vet_centers, :image
  end
end
