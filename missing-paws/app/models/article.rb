class Article < ActiveRecord::Base
  def self.search(query)
    key = "%#{query}%"
    where("title LIKE :search OR content LIKE :search", search: key)
  end
end
