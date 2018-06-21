$prompt = TTY::Prompt.new

## Menu Methods ##

def main_menu
  user_choice = $prompt.select("What options would you like to see?", ["Visit Options", "Review Options", "Exit App"])
  if user_choice == "Visit Options"
    visit_menu
  elsif user_choice == "Review Options"
    review_menu
  else
    puts "Thank you for using Attract-US!"
    exit
  end
end

def visit_menu
  loop do
    user_choice = $prompt.select("What would you like to do?", ["See My Visits", "Create A Visit", "Update A Visit", "Delete A Visit", "Go Back", "Exit App"])
    if user_choice == "See My Visits"
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      show_visits
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Create A Visit"
      create_visit
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Update A Visit"
      update_a_visit
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Delete A Visit"
      delete_visit
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Go Back"
      main_menu
    else
      puts "Thank you for using Attract-US!"
      exit
    end
  end
end

def review_menu
  loop do
    user_choice = $prompt.select("What would you like to do?", ["See My Reviews", "Create A Review", "Update A Review", "Delete A Review", "Go Back", "Exit App"])
    if user_choice == "See My Reviews"
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      show_reviews
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Create A Review"
      create_review
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Update A Review"
      update_a_review
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Delete A Review"
      delete_review
      puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    elsif user_choice == "Go Back"
      main_menu
    else
      puts "Thank you for using Attract-US!"
      exit
    end
  end
end

## CRUD Methods ##

## Visits CRUD ##

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

def update_a_visit
  user_choice_visit = $prompt.select("Which visit would you like to update? Note: You can only update the date of your visit. If you want to update the attraction, please return to the visit menu and delete the visit or create a new visit. (The first number is each visit's specific ID number)", [$user_traveller.display_my_visits, "Go Back"].flatten)
  if user_choice_visit == "Go Back"
    visit_menu
  else
    id_to_update = user_choice_visit.split(", ")[0].to_i
    puts "What date are you now visiting this attraction? (Example Format: January 1, 2019)"
    date_of_visit = gets.chomp
    Visit.update(id_to_update, date: date_of_visit)
    puts "Your visit has been updated!"
  end
end

def delete_visit
  user_choice_visit = $prompt.select("Which visit would you like to delete? (The first number is each visit's specific ID number)", [$user_traveller.display_my_visits, "Go Back"].flatten)
  if user_choice_visit == "Go Back"
    visit_menu
  else
    id_to_delete = user_choice_visit.split(", ")[0].to_i
    Visit.all.find(id_to_delete).destroy
    puts "Your visit has been deleted!"
  end
end

## Reviews CRUD ##

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

def update_a_review
  user_choice_review = $prompt.select("Which review would you like to update? (The first number is each visit's specific ID number)", [$user_traveller.display_my_reviews, "Go Back"].flatten)
  if user_choice_review == "Go Back"
    review_menu
  else
    id_to_update = user_choice_review.split(", ")[0].to_i
    user_choice_rating = $prompt.select("What rating would you like to give this attraction?", ["1", "2", "3", "4", "5", "Go Back"])
    if user_choice_rating == "Go Back"
      review_menu
    else
      rating_for_review = user_choice_rating.to_i
    end
    puts "What would you like the new message to be? (If you don't want to change your message, simply copy and paste your original message.)"
    message_for_review = gets.chomp
    Review.update(id_to_update, rating: rating_for_review, message: message_for_review)
    puts "Your review has been updated!"
  end
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
