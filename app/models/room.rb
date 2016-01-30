class Room < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages

  validates :name,
    presence: true,
    format: { without: /\A[[:blank:]]+\z/ },
    length: { maximum: 30 }

  def participate!(user)
    self.users << user
    save!
  end

  def participated?(user)
    users.include? user
  end
end
