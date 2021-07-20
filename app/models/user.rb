class User < ApplicationRecord
    before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    has_many :topics
    
     has_many :favorites
     has_many :favoriting, through: :favorites, source: :topic
     
  def tryfavorite(other_topics)
    self.favorites.find_or_create_by(topic_id: other_topics.id)
  end
  
  def unfavorite(other_topics)
    favorite = self.favorites.find_by(topic_id: other_topics.id)
    favorite.destroy if favorite
  end
  
  def favoriting?(other_topics)
    self.favoriting.include?(other_topics)
  end

 
 
end
