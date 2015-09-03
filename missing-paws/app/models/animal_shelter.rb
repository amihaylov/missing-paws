class AnimalShelter < ActiveRecord::Base

	belongs_to :user

	validates :user_id, presence: true
	
	def self.search(query)
		key = "%#{query}%"
		where("title LIKE :search OR description LIKE :search OR city LIKE :search", search: key)
	end 
end
