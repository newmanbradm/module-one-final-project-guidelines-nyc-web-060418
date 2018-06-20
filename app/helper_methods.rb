## Traveller Methods ##

## visit methods##

def get_array_of_visits
  $user_traveller.my_visits
end

def display_visits
  get_array_of_visits.each do |visit_instance|
    puts "Visit ID #{visit_instance.id}: #{visit_instance.attraction.name} on #{visit_instance.date}"
  end
end

def show_visits
  if $user_traveller.my_visits == []
    puts "You do not have any visits to view at this time."
  else
    display_visits
  end
end

## review methods ##

def get_array_of_reviews
  $user_traveller.my_reviews
end

def display_reviews
  get_array_of_reviews.each do |review_instance|
    puts "Review ID #{review_instance.id}: Attraction: #{review_instance.attraction.name}, Rating: #{review_instance.rating}, Message: #{review_instance.message}"
  end
end

def show_reviews
  if $user_traveller.my_reviews == []
    puts "You do not have any reviews to view at this time."
  else
    display_reviews
  end
end

# def show_all_attractions
#   Attraction.all.each do |attraction_instance|
#     puts "Attraction ID #{attraction_instance.id}: #{attraction_instance.name}, #{attraction_instance.city.name}"
#   end
# end

def ask_for_attraction_id
  puts "Please enter the attraction id from the list below:"
  show_all_attractions
  id_for_visit = gets.chomp
  attraction_to_be_visited = Attraction.find(id_for_visit)
  # if Attraction.find(id_for_visit)
  #   puts "That is not a valid attraction id. Please try again."
  #   show_all_attractions
  # end
end

def ask_for_date_of_visit
  puts "What date are you visiting this attraction? (Include Month, Day, and Year)"
end
