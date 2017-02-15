# Solar System assignment by Tamiko Terada

# start of SolarSystem class
class SolarSystem

  attr_accessor :planet_names, :get_planet, :continue, :add_planets, :user_choice, :age, :age_in_years, :learn_about # not really sure I need all these...

  def initialize(name) # method that runs with .new
    @name = name

  # ASCII for stars
    puts "
    *    .  *       .   ,          *
    .       . .        *
    *   .   .'    * ,      .       .  ,     *
    .     *     .'
    '     .     .  *        *  .'.
    .   ' '        .    .    '   .
    .  *        ,   *               '      *
    .
    *          .   *

    Congrats~! A new solar system called \"#{name}\" is created!
    "
    @planet_names = Array.new # array of planet names
    @get_planet = nil
    @continue = "y" # default
    add_planets # user-defined loop to add planets
    @planet_data = Hash.new
    user_choice # show planets to choose from and ask user to choose
    learn_about # print info about planet chosen

  end
  # user adds planets until "n"
  def add_planets
    while @continue == "y" do
      print "Add a planet by name. > "
      @get_planet = gets.chomp.downcase.capitalize # for formatting

      # let user know if there will be assigned stats
      if ["mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune"].include?(@get_planet)
        print "  #{@get_planet} has stats to see!"
      elsif @get_planet == "pluto"
        print "  #{@get_planet}'s a dwarf so no stats."
      else
        print "  #{@get_planet} is unknown. We've got no stats."
      end

      @planet_names.push(@get_planet) # add entered planet name to array

      # ask usr to continue or not
      print " Add another?(y/n) > "
      @continue = gets.chomp.downcase # accepts both 'Y' and 'y'
      until (continue == "y" || continue == "n") # validate input
        print "  Enter 'y' or 'n' >"
        @continue = gets.chomp.downcase
      end
    end
  end

  # user picks planet by listed number (planet_names index + 1)
  def user_choice
    puts "Which planet do you want to learn more about? > "
    @planet_names.each_with_index do |name, index|
      puts "#{index + 1}.\) #{name}"
    end

    until (1..@planet_names.length).include?(@user_choice) # valdate choice with range
      print "  Select one by it's number. > "
      @user_choice = gets.to_i
    end
  end

  # depending on user_choice create a new planet to get info
  def learn_about
    @selection = @planet_names[@user_choice - 1] # reference array by index (user_choice - 1)
    case @selection
    when "Mercury"
      @planet_data["Mercury"] = Planet.new(name: "Mercury", mass: 0.0553, diameter: 4879, rotation_period: 1407.6, length_of_day: 4222.6, distance_from_sun: 57.9, number_of_moons: 0, has_rings: false)
    when "Venus"
      @planet_data["Venus"] = Planet.new(name: "Venus", mass: 0.815, diameter: 12104, rotation_period: -5832.5, length_of_day: 2802, distance_from_sun: 108.2, number_of_moons: 0, has_rings: false)
    when "Earth"
      @planet_data["Earth"] = Planet.new(name: "Earth", mass: 1, diameter: 12756, rotation_period: 23.9, length_of_day: 24, distance_from_sun: 149.6, number_of_moons: 1, has_rings: false)
    when "Mars"
      @planet_data["Mars"] = Planet.new(name: "Mars", mass: 0.107, diameter: 6792, rotation_period: 24.6, length_of_day: 24.7, distance_from_sun: 227.9, number_of_moons: 2, has_rings: false)
    when "Jupiter"
      @planet_data["Jupiter"] = Planet.new(name: "Jupiter", mass: 317.8, diameter: 142984, rotation_period: 9.9, length_of_day: 9.9, distance_from_sun: 778.6, number_of_moons: 67, has_rings: true)
    when "Saturn"
      @planet_data["Saturn"] = Planet.new(name: "Saturn", mass: 14.5, diameter: 51118, rotation_period: -17.2, length_of_day: 17.2, distance_from_sun: 2872.5, number_of_moons: 27, has_rings: true)
    when "Uranus"
      @planet_data["Uranus"] = Planet.new(name: "Uranus", mass: 14.5, diameter: 51118, rotation_period: -17.2, length_of_day: 17.2, distance_from_sun: 2872.5, number_of_moons: 27, has_rings: true)
    when "Neptune"
      @planet_data["Neptune"] = Planet.new(name: "Neptune", mass: 17.1, diameter: 49528, rotation_period: 16.1, length_of_day: 16.1, distance_from_sun: 4495.1, number_of_moons: 14, has_rings: true)
    else "Unknown"
      @planet_data["Unknown"] = Planet.new(name: "Neptune", mass: 17.1, diameter: 49528, rotation_period: 16.1, length_of_day: 16.1, distance_from_sun: 4495.1, number_of_moons: 14, has_rings: true)
    end
    return @planet_data
  end

  # age of the solar system
  def age
    @age_in_years = 4600000000
    return @age_in_years
  end
end

# start of Planet class
class Planet

  attr_accessor :planet_hash, :name, :mass, :diameter, :rotation_period, :length_of_day, :distance_from_sun, :number_of_moons, :has_rings

  # import planet_hash attribute as a hash with key
    def initialize(planet_hash)
    @planet_hash = {},
    @name = planet_hash[:name],
    @mass = planet_hash[:mass],
    @diameter = planet_hash[:diameter],
    @rotation_period = planet_hash[:rotation_period],
    @length_of_day = planet_hash[:length_of_day],
    @distance_from_sun = planet_hash[:distance_from_sun],
    @number_of_moons = planet_hash[:number_of_moons],
    @has_rings = planet_hash[:has_rings]
    print_planet_info
  end

  # print planet info = hash key + value (handle new in each case)
  def print_planet_info
    if @name == nil
      puts "\nHere's some info about an unnamed planet: "
    else
      puts "\nHere's some info about #{@name.upcase} >>> "
    end

    if @mass == nil
      puts " ~ Mass: unknown"
    else
      puts " ~ Mass: #{@mass} x Earth's mass"
    end

    if @diameter == nil
      puts " ~ Diameter: unknown"
    else
      puts " ~ Diameter: #{@diameter} km"
    end

    if @rotation_period == nil
      puts " ~ Solar Rotation: unknown"
    else
      puts " ~ Solar Rotation: #{@rotation_period} Earth hours"
    end

    if @length_of_day == nil
      puts " ~ Lengh of Day: unknown"
    else
      puts " ~ Length of Day: #{@length_of_day} Earth Hours"
    end

    if @distance_from_sun == nil
      puts " ~ Distance from Sun: unknown"
    else
      puts " ~ Distance from Sun: #{@length_of_day} * 10^6 km"
    end

    if @has_rings == nil
      puts " ~ Has rings? Unknown"
    elsif @has_rings == true
      puts " ~ Has rings? Yes"
    else
      puts " ~ Has rings? Nope"
    end

  end
end

######################

print "SOLAR SYSTEM PROJECT\nWhat's your solar system called? > "
entered_name = gets.chomp
my_solar_system = SolarSystem.new(entered_name)
puts "\np.s. Your Solar System is #{my_solar_system.age} years old!"

# end
