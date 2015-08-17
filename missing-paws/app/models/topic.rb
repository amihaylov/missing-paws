class Topic < ActiveRecord::Base
	def self.search(query)
    	key = "%#{query}%"
    	where("title LIKE :search OR category LIKE :search OR text LIKE :search", search: key)
	end 
end
