$prompt = TTY::Prompt.new

## Traveller Methods ##

## visit methods##

def get_array_of_visits
  $user_traveller.my_visits
end

def display_visits
  get_array_of_visits.each do |visit_instance|
    puts "#{visit_instance.attraction.name}, #{visit_instance.attraction.city.name} on #{visit_instance.date}"
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
    puts "Review of #{review_instance.attraction.name} in #{review_instance.attraction.city.name} -- Rating: #{review_instance.rating}, Message: #{review_instance.message}"
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


def create_visit
  user_choice_attraction = $prompt.select("Which attraction are you visitng?", [Attraction.show_all_attractions, "Go Back"].flatten)
  if user_choice_attraction == "Go Back"
    visit_menu
  else
    attraction_name = user_choice_attraction.split(", ")[0]
    attraction_of_visit = Attraction.find_by(name: attraction_name)
  end
  puts "What date are you visiting this attraction? (Example Format: January 1, 2019)"
  date_of_visit = gets.chomp
  $user_traveller.add_visit(attraction_of_visit, date_of_visit)
  puts "Your visit has been added!"
end

def delete_visit
  user_choice_visit = $prompt.select("Which visit would you like to delete? (The first number is each visit's specific ID number)", [$user_traveller.display_my_visits, "Go Back"].flatten)
  if user_choice_visit == "Go Back"
    visit_menu
  else
    id_to_delete = user_choice_visit.split(", ")[0].to_i
    binding.pry
    Review.all.find(id_to_delete).destroy
    puts "Your visit has been deleted!"
  end
end

def create_review
  user_choice_attraction = $prompt.select("Which attraction would you like to review?", [Attraction.show_all_attractions, "Go Back"].flatten)
  if user_choice_attraction == "Go Back"
    review_menu
  else
    attraction_name = user_choice_attraction.split(", ")[0]
    attraction_of_review = Attraction.find_by(name: attraction_name)
  end
  user_choice_rating = $prompt.select("What rating would you like to give this attraction?", ["1", "2", "3", "4", "5", "Go Back"])
  if user_choice_rating == "Go Back"
    review_menu
  else
    rating_for_review = user_choice_rating.to_i
  end
  puts "What would you like to say about this attraction?"
  message_of_review = gets.chomp
  $user_traveller.add_review(attraction_of_review, rating_for_review, message_of_review)
  puts "Your review has been added!"
end

def delete_review
  user_choice_review = $prompt.select("Which review would you like to delete? (The first number is each review's specific ID number)", [$user_traveller.display_my_reviews, "Go Back"].flatten)
  if user_choice_review == "Go Back"
    review_menu
  else
    id_to_delete = user_choice_review.split(", ")[0].to_i
    Review.all.find(id_to_delete).destroy
    puts "Your review has been deleted!"
  end
end
