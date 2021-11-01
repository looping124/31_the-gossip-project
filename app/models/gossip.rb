class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_many :taggers
  has_many :tags, through: :taggers
end
