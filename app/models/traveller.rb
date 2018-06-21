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

  def display_my_visits
    my_visits.map do |visit_instance|
      "#{visit_instance.attraction.name}, #{visit_instance.attraction.city.name}, #{visit_instance.date}"
    end
  end

  def add_visit(attraction, date)
    Visit.create(traveller: self, attraction: attraction, date: date)
  end

  def update_visit(id, date)
    Visit.update(id, date: date)
  end

  def destroy_visit(id)
    Visit.find(id).destroy
  end

  def my_reviews
    Review.all.select do |review_instance|
      review_instance.traveller == self
    end
  end

  def add_review(attraction, rating, message)
    Review.create(traveller: self, attraction: attraction, rating: rating, message: message)
  end

  def update_review(id, rating, message)
    Review.update(id, rating: rating, message: message)
  end

  def destroy_review(id)
    Review.find(id).destroy
  end

end
