class VetCenter < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: { large: "500x900>", medium: "300x300>", thumb: "150x150>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	validates :user_id, presence: true
	def self.search(query)
		key = "%#{query}%"
		where("title LIKE :search OR description LIKE :search OR city LIKE :search", search: key)
	end 
end
