require_relative '../config/environment'
require 'pry'


puts "Welcome to AttractUS! Please enter your email address:"

user_email_response = gets.chomp
$user_email = user_email_response.downcase

$user_traveller = Traveller.all.find_by(email: $user_email)

if $user_traveller == nil
  puts "In order to finish your profile, please enter your full name:"
  user_name = gets.chomp
  $user_traveller = Traveller.create(name: user_name, email: $user_email)
end


puts "Hello, #{$user_traveller.name}! What would you like to do? Please type one of the following options:"
puts ["Explore My Visits", "Explore My Reviews"]

def initial_menu
  response = gets.chomp

  if response.downcase == "explore my visits"
    show_visits
  elsif response.downcase == "explore my reviews"
    show_reviews
  else
    puts "You did not enter a valid response. Please try again from the following options:"
    puts ["Explore My Visits", "Explore My Reviews"]
    initial_menu
  end
end

initial_menu
