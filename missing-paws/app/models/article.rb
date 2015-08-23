class Article < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true
	validates :content, presence: true
	validates :image, attachment_presence: true

	has_attached_file :image, styles: { large: "500x900>", medium: "300x300>", thumb: "150x150>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


	def self.search(query)
		key = "%#{query}%"
		where("title LIKE :search OR content LIKE :search", search: key)
	end


end
