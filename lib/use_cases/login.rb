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

  # def password_attempts
  #   counter = 0
  #   until counter >= 4 do
  #     puts "Wrong password. You have #{3 - counter} attempts remaining"
  #     counter += 1
  #     if counter == 3 then puts "Password limit exceeded."
  #       break
  #     end
  #   end
  # end

  # def password_attempts_proposal
  #   3.times do |i|
  #     input = gets.chomp
  #     if input == user.password
  #       return
  #     else
  #       puts 'wrong password'
  #     end
  #   end
  #   puts 'password limit'
  # end
