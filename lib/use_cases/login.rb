class Login
  def initialize(handle, password, users)
    @handle = handle
    @password = password
    @users = users
  end

  def user
    user_with_handle = @users.find { |user| user.handle == @handle }
  end

  def greet
    puts "Welcome back #{user.name}!"
  end
  
  def log_in
    if user&.password == @password
      greet
    elsif user
      counter = 0
      puts "Incorrect password.\n"
      until counter >= 4 do
        puts "Enter your password. #{3 - counter} attempts remaining."
        @password = gets.chomp
        counter += 1
        if user&.password == @password
          greet
          break
        elsif counter == 3 then puts "Password limit exceeded."
          break
        end
      end
    else
      puts "Sorry, we could not find your account.\n\n"
    end
  end

  def perform
    log_in
  end
end
