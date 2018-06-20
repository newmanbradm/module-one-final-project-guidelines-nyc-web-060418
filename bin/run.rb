require_relative '../config/environment'
require 'pry'
$prompt = TTY::Prompt.new

def welcome
puts <<-TITLE
█████╗ ████████╗████████╗██████╗  █████╗  ██████╗████████╗              ██╗   ██╗███████╗
██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝              ██║   ██║██╔════╝
███████║   ██║      ██║   ██████╔╝███████║██║        ██║       █████╗    ██║   ██║███████╗
██╔══██║   ██║      ██║   ██╔══██╗██╔══██║██║        ██║       ╚════╝    ██║   ██║╚════██║
██║  ██║   ██║      ██║   ██║  ██║██║  ██║╚██████╗   ██║                 ╚██████╔╝███████║
╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝                  ╚═════╝ ╚══════╝

TITLE
end

welcome
puts "Welcome to Attract-US! Please enter your email address:"

user_email_response = gets.chomp
$user_email = user_email_response.downcase

$user_traveller = Traveller.all.find_by(email: $user_email)

if $user_traveller == nil
  puts "In order to finish your profile, please enter your full name:"
  user_name = gets.chomp
  $user_traveller = Traveller.create(name: user_name, email: $user_email)
end



# def main_menu
#   loop do
#     puts "What would you like to do? Please type one of the following options:"
#     puts ["VISIT OPTIONS:", "See My Visits", "Create A Visit", "Update A Visit", "Delete A Visit", "REVIEW OPTIONS:", "See My Reviews", "Create A Review", "Update A Review", "Delete A Review", "OR:", "Exit App"]
#     user_choice = $prompt.select("")
#
#     if response.downcase == "see my visits"
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#       show_visits
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif response.downcase == "create a visit"
#       puts "Please enter the attraction id from the list below:"
#       show_all_attractions
#       id_for_visit = gets.chomp
#       create_visit
#     elsif response.downcase == "update a visit"
#       update_a_visit
#     elsif response.downcase == "delete a visit"
#       delete_visit
#     elsif response.downcase == "see my reviews"
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#       show_reviews
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif response.downcase == "create a review"
#       create_review
#     elsif response.downcase == "update a review"
#       update_a_review
#     elsif response.downcase == "delete a review"
#       delete_review
#     elsif response.downcase == "exit app"
#       puts "Thanks for using Attract-US!"
#       exit
#     else
#       puts "You did not enter a valid response. Please try again!"
#     end
#   end
# end

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

    elsif user_choice == "Update A Visit"

    elsif user_choice == "Delete A Visit"

    elsif user_choice == "Go Back"
      main_menu
    else
      puts "Thank you for using Attract_US!"
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

    elsif user_choice == "Update A Review"

    elsif user_choice == "Delete A Review"

    elsif user_choice == "Go Back"
      main_menu
    else
      puts "Thank you for using Attract_US!"
      exit
    end
  end
end

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Hello, #{$user_traveller.name}!"
main_menu
