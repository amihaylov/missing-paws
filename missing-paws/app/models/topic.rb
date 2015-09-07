class Topic < ActiveRecord::Base

	has_attached_file :image, styles: { large: "500x900>", medium: "300x300>", thumb: "150x150>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	
	def self.search(query)
		key = "%#{query}%"
		where("title LIKE :search OR category LIKE :search OR text LIKE :search", search: key)
	end 
end
