class Attraction < ActiveRecord::Base

  belongs_to :city
  has_many :visits
  has_many :reviews
  has_many :travellers, through: :visits
  has_many :travellers, through: :reviews

  def self.show_all_attractions
    all.map do |attraction_instance|
      "#{attraction_instance.name}, #{attraction_instance.city.name}"
    end
  end

end
