class Topic < ApplicationRecord
  belongs_to :user
  
  validates :description, presence: true, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  
   has_many :favorites, dependent: :destroy
   has_many :fovorited, through: :favorites, source: :user, dependent: :destroy
   
   def self.search(keyword)
  where(["description like?","%#{keyword}%"])
   end
   
  
end
