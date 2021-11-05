class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :private_messages
  has_secure_password
  validates :password, length: { minimum: 2, message: 'Password should be minimum 2 characters'}
  validates :email, presence: true, uniqueness: true

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.remember_digest = remember_digest
    self.save(:validate => false)
    puts "TOTOTOTOTOTOTOTOTOTOTOTOTOTOTOTO"
    puts self.remember_digest
  end

end
