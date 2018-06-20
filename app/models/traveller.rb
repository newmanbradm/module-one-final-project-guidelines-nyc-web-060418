class Traveller < ActiveRecord::Base

  has_many :visits
  has_many :reviews
  has_many :attractions, through: :visits
  has_many :attractions, through: :reviews

  def my_visits
    Visit.all.select do |visit_instance|
      visit_instance.traveller == self
    end
  end

  def my_reviews
    Review.all.select do |review_instance|
      review_instance.traveller == self
    end
  end

end
