class Player < ApplicationRecord
  def self.search(search)
    where("player LIKE ?", "%#{search}%")
  end
end
