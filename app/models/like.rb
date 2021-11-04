class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user
  validates_uniqueness_of :likeable_id, scope: :user_id, message: "duplicate like"
end
