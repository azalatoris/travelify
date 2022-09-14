Country = Struct.new(:name, :continent)

countries = [
  Country.new("Lithuania", "Europe"),
  Country.new("USA", "North America"),
  Country.new("Ecuador", "South America"),
  Country.new("Bahamas", "North America"),
  Country.new("Italy", "Europe"),
  Country.new("Nigeria", "Africa"),
  Country.new("South Korea", "Asia"),
  Country.new("New Zealand", "Oceania"),
  Country.new("Maldives", "Asia")
]

countries.each do |country|
  puts "#{country.name} is a country in #{country.continent}."
end