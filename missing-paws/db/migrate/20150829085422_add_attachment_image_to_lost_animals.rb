class AddAttachmentImageToLostAnimals < ActiveRecord::Migration
  def self.up
    change_table :lost_animals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :lost_animals, :image
  end
end
