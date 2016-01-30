class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :rooms
  has_many :messages

  validates :name,
    presence: true,
    format: { with: /\A[0-9a-zA-Z\-_]+\z/ },
    length: { maximum: 30 },
    uniqueness: true
end
