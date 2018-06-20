## Traveller Methods ##

def show_visits
  if $user_traveller.my_visits == []
    puts "You do not have any visits to view at this time."
  else
    p $user_traveller.my_visits
  end
end

def show_reviews
  if $user_traveller.my_reviews == []
    puts "You do not have any reviews to view at this time."
  else
    p $user_traveller.my_reviews
  end
end
