require_relative 'use_cases/sign_up'
require_relative 'use_cases/login'

User = Struct.new(:name, :handle, :email, :password)

USERS = [
  User.new("Algirdas Zalatoris", "azalatoris", "a@z.com", "$password1"),
  User.new("Homer Simpson", "homer", "h@s.com", "_password2"),
  User.new("Arthur Morgan", "a_morgan", "a@m.com", "password3."),
  User.new("Jonas Jonka", "jjonka", "j@j.com", "password4!")
].freeze

@users = USERS.dup
# SignUp.new('Algirdas Zalatoris', 'azalatori', 'a@z.com', "2password!", users).perform

def main
  SignUp.welcome
  input = gets.chomp.upcase
  case input
    when 'S'
      puts 'Insert your name:'
      name = gets.chomp
      puts 'Insert your handle:'
      handle = gets.chomp 
      puts 'Insert your email:'
      email = gets.chomp
      puts 'Insert your password:'
      password = gets.chomp
      users = @users
      SignUp.new(name, handle, email, password, @users).perform
    when 'L' 
      puts 'Enter your handle'
      handle = gets.chomp
      puts 'Enter your password'
      password = gets.chomp
      Login.new(handle, password, @users).perform
    when 'Q'
      p "See you next time!"
    else puts "Invalid entry\n\n"
  end
end

main