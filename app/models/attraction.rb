class Attraction < ActiveRecord::Base

  belongs_to :city
  has_many :visits
  has_many :reviews
  has_many :travellers, through: :visits
  has_many :travellers, through: :reviews

end
