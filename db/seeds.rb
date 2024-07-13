require 'faker'

# Clear existing data
Message.destroy_all
Chatroom.destroy_all
Team.destroy_all
Competition.destroy_all
UserSport.destroy_all  # Ajouter cette ligne pour détruire les UserSport avant les Sports
Sport.destroy_all
User.destroy_all

# Array of user data
users_data = [
  { email: "hello@hotmail.com", password: "123456", password_confirmation: "123456" },
  { email: "hello1@hotmail.com", password: "123456", password_confirmation: "123456" },
  { email: "hello2@hotmail.com", password: "123456", password_confirmation: "123456" }
]

# Create sports
sports = {
  tennis: Sport.create!(name: "Tennis", created_at: Time.now, updated_at: Time.now),
  badminton: Sport.create!(name: "Badminton", created_at: Time.now, updated_at: Time.now),
  padel: Sport.create!(name: "Padel", created_at: Time.now, updated_at: Time.now),
  tennis_de_table: Sport.create!(name: "Tennis de table", created_at: Time.now, updated_at: Time.now)
}

# Possible palmares values
palmares_values = [
  "Champion de France",
  "Vice-champion de France",
  "Champion régional",
  "Champion départemental",
  "Champion de club"
]

# Create users and their user_sports
users_data.each do |user_data|
  user = User.create!(
    email: user_data[:email],
    password: user_data[:password],
    password_confirmation: user_data[:password_confirmation],
    created_at: Time.now,
    updated_at: Time.now
  )

  puts "User created with email: #{user.email}"

  # Assign Tennis and Badminton with palmares and level to each user
  ['tennis', 'badminton'].each do |sport|
    UserSport.create!(
      user: user,
      sport: sports[sport.to_sym],
      level: rand(1..5000), # Random level between 1 and 5000
      palmares: palmares_values.sample, # Random palmares from the list
      created_at: Time.now,
      updated_at: Time.now
    )
    puts "#{sport.capitalize} assigned to user with level and palmares"
  end
end

# Create competitions and teams for each sport
sports_with_competitions = [
  {
    name: "Tennis",
    competitions: [
      { name: "Roland-Garros", city: "Paris", address: "2 Avenue Gordon Bennett, 75016 Paris" },
      { name: "Open de France", city: "Lyon", address: "155 Boulevard Stalingrad, 69006 Lyon" },
      { name: "Masters de Paris", city: "Paris", address: "8 Boulevard de Bercy, 75012 Paris" },
      { name: "Tournoi de Printemps", city: "Montpellier", address: "22 Rue, Montpellier" }
    ]
  },
  {
    name: "Padel",
    competitions: [
      { name: "Coupe Padel Paris", city: "Paris", address: "10 Rue des Meuniers, 75012 Paris" },
      { name: "Open de Padel Lyon", city: "Lyon", address: "66 Avenue Paul Santy, 69008 Lyon" },
      { name: "Marseille Padel Open", city: "Marseille", address: "28 Boulevard de Pont de Vivaux, 13010 Marseille" },
      { name: "Montpellier Padel Challenge", city: "Montpellier", address: "19 Rue Paul Rimbaud, 34000 Montpellier" }
    ]
  },
  {
    name: "Tennis de table",
    competitions: [
      { name: "Championnat de Paris", city: "Paris", address: "5 Rue Léo Delibes, 75016 Paris" },
      { name: "Lyon Ping Open", city: "Lyon", address: "10 Rue Robert, 69006 Lyon" },
      { name: "Marseille Table Tennis Cup", city: "Marseille", address: "15 Avenue du Prado, 13006 Marseille" },
      { name: "Montpellier Ping Challenge", city: "Montpellier", address: "39 Rue Saint-Firmin, 34000 Montpellier" }
    ]
  },
  {
    name: "Badminton",
    competitions: [
      { name: "Championnat de France de Badminton", city: "Paris", address: "25 Avenue Pierre de Coubertin, 75013 Paris" },
      { name: "Lyon Badminton Cup", city: "Lyon", address: "8 Avenue Jean Mermoz, 69008 Lyon" },
      { name: "Marseille Badminton Festival", city: "Marseille", address: "40 Boulevard Charles Livon, 13007 Marseille" },
      { name: "Montpellier Badminton Challenge", city: "Montpellier", address: "111 Place Vauban, 34000 Montpellier" }
    ]
  }
]

sports_with_competitions.each do |sport_data|
  sport = Sport.find_by(name: sport_data[:name])

  if sport.nil?
    puts "Sport not found: #{sport_data[:name]}"
    next
  end

  puts "Sport found: #{sport.name}"

  sport_data[:competitions].each do |competition_data|
    competition = Competition.create!(
      sport: sport,
      name: competition_data[:name],
      number_of_teams: rand(3..6), # Random number of teams between 3 to 6
      date_time: Faker::Time.forward(days: 30),
      address: competition_data[:address],
      created_at: Time.now,
      updated_at: Time.now
    )

    puts "Competition created: #{competition.name}"

    # Create teams for this competition
    competition.number_of_teams.times do |i|
      team = Team.create!(
        owner: User.all.sample, # Assign a random user as the owner of the team
        competition: competition,
        name: "#{competition_data[:name]} Team #{i + 1}",
        number_max_of_participants: rand(5..15),
        created_at: Time.now,
        updated_at: Time.now
      )

      puts "Team created: #{team.name} for competition: #{competition.name}"
    end
  end
end

puts "Seed completed successfully."
