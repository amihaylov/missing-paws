class Adoption < ActiveRecord::Base
	def self.search(query)
    key = "%#{query}%"
    where("title LIKE :search OR city LIKE :search OR description LIKE :search", search: key)
  end 
end
