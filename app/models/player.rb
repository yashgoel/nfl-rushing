class Player < ApplicationRecord
  def self.search(search)
    where("player LIKE ?", "%#{search}%")
  end

  def self.to_csv(options = {})
    CSV.generate(headers: true) do |csv|
      csv << column_names
      all.each do |player|
        csv << player.attributes.values
      end
    end
  end
end
