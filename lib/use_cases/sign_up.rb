class SignUp
  def initialize(name, handle, email, password, users)
    @name = name
    @handle = handle
    @email = email
    @password = password
    @users = users
  end

  def self.welcome
    puts "Welcome to Travelify!"
    puts "Become a famous traveler: hit 'S'"
    puts "Log in: hit 'L'"
    puts "Quit: hit 'Q'\n\n"
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
    elsif handle_error
      puts "Handle already taken. Try again!"
    elsif email_error
      puts "Email already taken. Try again!"
    else
      add_user
      return_users
    end
  end

  def perform
    create_user
  end
end