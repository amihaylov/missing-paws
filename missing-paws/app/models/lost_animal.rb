class LostAnimal < ActiveRecord::Base
	belongs_to :user
  validates :user_id, presence: true
  def self.search(query)
    key = "%#{query}%"
    where("title LIKE :search OR city LIKE :search OR description LIKE :search", search: key)
  end 
end
