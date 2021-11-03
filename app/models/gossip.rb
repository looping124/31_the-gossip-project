class Gossip < ApplicationRecord

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :taggers
  has_many :tags, through: :taggers
  validates :title, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { minimum: 4 }
  has_one :city, through: :user
  
end
