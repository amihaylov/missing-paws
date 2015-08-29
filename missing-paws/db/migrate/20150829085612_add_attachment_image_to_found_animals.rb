class AddAttachmentImageToFoundAnimals < ActiveRecord::Migration
  def self.up
    change_table :found_animals do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :found_animals, :image
  end
end
