class Traveller < ActiveRecord::Base

  has_many :visits
  has_many :reviews
  has_many :attractions, through: :visits
  has_many :attractions, through: :reviews

end
