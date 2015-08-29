class FoundAnimal < ActiveRecord::Base
	belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :image, attachment_presence: true
  validates :name, presence: true
  validates :phone, presence: true 
  validates :email, presence: true 
  validates :city, presence: true 

  has_attached_file :image, styles: { large: "500x900>", medium: "300x300>", thumb: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.search(query)
    key = "%#{query}%"
    where("title LIKE :search OR city LIKE :search OR description LIKE :search", search: key)
  end 
end
