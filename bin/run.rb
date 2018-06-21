require_relative '../config/environment'
require 'pry'
require_relative 'helper_methods.rb'
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
#   user_choice = $prompt.select("What options would you like to see?", ["Visit Options", "Review Options", "Exit App"])
#   if user_choice == "Visit Options"
#     visit_menu
#   elsif user_choice == "Review Options"
#     review_menu
#   else
#     puts "Thank you for using Attract-US!"
#     exit
#   end
# end
#
# def visit_menu
#   loop do
#     user_choice = $prompt.select("What would you like to do?", ["See My Visits", "Create A Visit", "Update A Visit", "Delete A Visit", "Go Back", "Exit App"])
#     if user_choice == "See My Visits"
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#       show_visits
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Create A Visit"
#       create_visit
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Update A Visit"
#       update_a_visit
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Delete A Visit"
#       delete_visit
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Go Back"
#       main_menu
#     else
#       puts "Thank you for using Attract-US!"
#       exit
#     end
#   end
# end
#
# def review_menu
#   loop do
#     user_choice = $prompt.select("What would you like to do?", ["See My Reviews", "Create A Review", "Update A Review", "Delete A Review", "Go Back", "Exit App"])
#     if user_choice == "See My Reviews"
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#       show_reviews
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Create A Review"
#       create_review
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Update A Review"
#       update_a_review
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Delete A Review"
#       delete_review
#       puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
#     elsif user_choice == "Go Back"
#       main_menu
#     else
#       puts "Thank you for using Attract-US!"
#       exit
#     end
#   end
# end

puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Hello, #{$user_traveller.name}!"
main_menu
