class Forum < ActiveRecord::Base
  belongs_to :user
  has_many :forum_comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
 