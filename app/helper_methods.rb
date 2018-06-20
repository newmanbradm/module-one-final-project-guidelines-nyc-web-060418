## Traveller Methods ##
require 'pry'

def show_visits
  if $user_traveller.my_visits == []
    puts "You do not have any visits to view at this time."
  else
    display_visits
  end
end

def show_reviews
  if $user_traveller.my_reviews == []
    puts "You do not have any reviews to view at this time."
  else
    display_reviews
  end
end

def get_array_of_visits
  $user_traveller.my_visits
end

def display_visits
  get_array_of_visits.each do |visit_instance|
    puts "Visit ID #{visit_instance.id}: #{visit_instance.attraction.name} on #{visit_instance.date}"
  end
end

def get_array_of_reviews
  $user_traveller.my_reviews
end

def display_reviews
  get_array_of_reviews.each do |review_instance|
    puts "Review ID #{review_instance.id}: Attraction: #{review_instance.attraction.name}, Rating: #{review_instance.rating}, Message: #{review_instance.message}"
  end
end
