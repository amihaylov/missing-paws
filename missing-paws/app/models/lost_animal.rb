class LostAnimal < ActiveRecord::Base
	belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :name, presence: true
  validates :phone, presence: true 
  validates :email, presence: true 
  validates :city, presence: true 
  def self.search(query)
    key = "%#{query}%"
    where("title LIKE :search OR city LIKE :search OR description LIKE :search", search: key)
  end 
end
