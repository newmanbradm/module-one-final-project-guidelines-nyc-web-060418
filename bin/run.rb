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


puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts "Hello, #{$user_traveller.name}!"
main_menu
