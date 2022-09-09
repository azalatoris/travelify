User = Struct.new(:name, :handle, :email, :password)

USERS = [
  User.new("Algirdas Zalatoris", "azalatoris", "a@z.com", "$password1"),
  User.new("Homer Simpson", "homer", "h@s.com", "_password2"),
  User.new("Arthur Morgan", "a_morgan", "a@m.com", "password3."),
  User.new("Jonas Jonka", "jjonka", "j@j.com", "password4!")
].freeze

class SignUp
  def initialize(name, handle, email, password, users)
    @name = name
    @handle = handle
    @email = email
    @users = users
  end

  def return_users
    puts "Here is the full user list:"
    puts @users.map { |user| user.handle }
  end

  def handle_password_hash
    users_hash = Hash.new
    @users.map { |user| users_hash[user.handle] = user.password }
    return users_hash
  end

  def handle_error
    user_handles = @users.map do |user| 
      user.handle
    end
    user_handles.include?(@handle) 
  end
  
  def email_error
    user_emails = @users.map do |user|
      user.email
    end 
    user_emails.include?(@email)
  end
  
  def add_user
    puts "User created successfully!"
    new_user = User.new(@name, @handle, @email, @password)
    @users << new_user
  end

  def create_user
    if handle_error && email_error
      puts "Handle and email already taken. Try again!"
      perform
    elsif handle_error
      puts "Handle already taken. Try again!"
      perform
    elsif email_error
      puts "Email already taken. Try again!"
      perform
    else
      add_user
      return_users
    end
  end

  def login
    puts "Enter your handle:"
    handle_input = gets.chomp
    puts "Enter your password"
    password_input = gets.chomp

    user_with_handle = @users.find { |user| user.handle == handle_input }

    if user_with_handle&.password == password_input
      puts "Welcome back #{user_with_handle.name}!"
    elsif user_with_handle
      puts "Incorrect password.\n\n"
    else
      puts "Sorry, we could not find your account.\n\n"
    end
  end

  def quit
    puts "See you next time!"
  end

  def welcome
    puts "Welcome to Travelify!"
    puts "Become a famous traveler: hit 'S'"
    puts "Log in: hit 'L'"
    puts "Quit: hit 'Q'"
  end

  def perform
    welcome
    input = gets.chomp.upcase
    case input
      when 'S' then create_user
      when 'L' then login
      when 'Q' then quit
      else p "Invalid entry"
        welcome
    end
  end
end

users = USERS.dup
SignUp.new('Algirdas Zalatoris', 'azalatori', 'a@z.com', "2password!", users).perform

#Correct perform
#How to extract the name from struct?
#input

#separating use case itself from part of the program letting interact with the console. Login, create_user and quit too much in perform. For different use cases
