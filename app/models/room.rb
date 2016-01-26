class Room < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :messages

  def entry!(user)
    self.users << user
    save!
  end
end
