require 'faker'
require 'open-uri'

# Clear existing data
Message.destroy_all
Chatroom.destroy_all
Team.destroy_all
Competition.destroy_all
UserSport.destroy_all
Sport.destroy_all
User.destroy_all

# Array of user data
users_data = [
  { email: "hello@hotmail.com", password: "123456", password_confirmation: "123456", name: "Stephanie" },
  { email: "hello1@hotmail.com", password: "123456", password_confirmation: "123456", name: "Arnaud" },
  { email: "hello2@hotmail.com", password: "123456", password_confirmation: "123456", name: "Julien" }
]

# Créer 30 autres utilisateurs avec des prénoms aléatoires
30.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password", # Vous pouvez changer le mot de passe selon vos besoins
    password_confirmation: "password",
    name: Faker::Name.first_name
  )
end

puts "30 utilisateurs supplémentaires créés avec succès."

# Create sports
sports = {
  tennis: Sport.create!(name: "Tennis", created_at: Time.now, updated_at: Time.now),
  badminton: Sport.create!(name: "Badminton", created_at: Time.now, updated_at: Time.now),
  padel: Sport.create!(name: "Padel", created_at: Time.now, updated_at: Time.now),
  ping_pong: Sport.create!(name: "Ping-pong", created_at: Time.now, updated_at: Time.now)
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
    name: user_data[:name],
    password: user_data[:password],
    password_confirmation: user_data[:password_confirmation],
    created_at: Time.now,
    updated_at: Time.now
  )

  puts "User created with email: #{user.email}"

  ['tennis', 'badminton'].each do |sport|
    UserSport.create!(
      user: user,
      sport: sports[sport.to_sym],
      level: rand(1..5000),
      palmares: palmares_values.sample,
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
      { name: "Roland-Parios", city: "Paris", address: "2 Avenue Gordon Bennett, 75016 Paris", date: Date.new(2024, 5, 30), time: Time.new(2024, 5, 30, 14, 0, 0), cost: 100.0, image_path: "tennis_card.png", description: "Le prestigieux tournoi Roland Parios du calendrier tennistique.", number_of_teams: 13, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486534/tennis_card_rhklbe.png" },
      { name: "France Open", city: "Lyon", address: "155 Boulevard Stalingrad, 69006 Lyon", date: Date.new(2024, 6, 15), time: Time.new(2024, 6, 15, 10, 0, 0), cost: 50.0, image_path: "tennis_card.png", description: "Un tournoi de tennis excitant à Lyon, réunissant les meilleurs talents.", number_of_teams: 6, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486534/tennis_card_rhklbe.png" },
      { name: "Paris Masters", city: "Paris", address: "8 Boulevard de Bercy, 75012 Paris", date: Date.new(2024, 7, 10), time: Time.new(2024, 7, 10, 16, 0, 0), cost: 75.0, image_path: "tennis_card.png", description: "Le prestigieux Paris Masters, connu pour ses matchs compétitifs.", number_of_teams: 7, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486534/tennis_card_rhklbe.png" }
    ]
  },
  {
    name: "Padel",
    competitions: [
      { name: "Padel Cup", city: "Lyon", address: "66 Avenue Paul Santy, 69008 Lyon", date: Date.new(2024, 8, 20), time: Time.new(2024, 8, 20, 11, 0, 0), cost: 60.0, image_path: "Padel man vector_card homepage.png", description: "La passionnante Padel Cup à Lyon, attirant des joueurs du monde entier.", number_of_teams: 15, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486526/Padel_man_vector_card_homepage_vgwpyq.png" },
      { name: "Padel Paris", city: "Paris", address: "10 Rue des Meuniers, 75012 Paris", date: Date.new(2024, 9, 15), time: Time.new(2024, 9, 15, 12, 0, 0), cost: 55.0, image_path: "Padel man vector_card homepage.png", description: "Le palpitant tournoi de Padel Lyon, un événement incontournable pour les passionnés.", number_of_teams: 6, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486526/Padel_man_vector_card_homepage_vgwpyq.png" },
      { name: "Marseille Open", city: "Marseille", address: "28 Boulevard de Pont de Vivaux, 13010 Marseille", date: Date.new(2024, 10, 10), time: Time.new(2024, 10, 10, 14, 0, 0), cost: 65.0, image_path: "Padel man vector_card homepage.png", description: "Le défiant Open de Marseille, mettant en vedette des matchs de Padel de haut niveau.", number_of_teams: 7, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486526/Padel_man_vector_card_homepage_vgwpyq.png" }
    ]
  },
  {
    name: "Ping-pong",
    competitions: [
      { name: "Ping Tour", city: "Marseille", address: "40 Boulevard Charles Livon, 13007 Marseille", date: Date.new(2024, 10, 5), time: Time.new(2024, 10, 5, 13, 0, 0), cost: 40.0, image_path: "ping pong vector image_card homepage.png", description: "Le tournoi ultime de Ping-pong à Marseille, connu pour ses matchs intenses.", number_of_teams: 14, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486525/ping_pong_vector_image_card_homepage_rdeoo4.png" },
      { name: "Spin Lyon", city: "Lyon", address: "10 Rue Robert, 69006 Lyon", date: Date.new(2024, 11, 10), time: Time.new(2024, 11, 10, 14, 0, 0), cost: 30.0, image_path: "ping pong vector image_card homepage.png", description: "Le passionnant tournoi Spin Lyon, réunissant les meilleurs joueurs.", number_of_teams: 5, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486525/ping_pong_vector_image_card_homepage_rdeoo4.png" },
      { name: "Marseille Clash", city: "Marseille", address: "15 Avenue du Prado, 13006 Marseille", date: Date.new(2024, 12, 15), time: Time.new(2024, 12, 15, 9, 0, 0), cost: 35.0, image_path: "ping pong vector image_card homepage.png", description: "Le tournoi compétitif Marseille Clash, attirant des joueurs de tout le pays.", number_of_teams: 7, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486525/ping_pong_vector_image_card_homepage_rdeoo4.png" }
    ]
  },
  {
    name: "Badminton",
    competitions: [
      { name: "France Bad", city: "Paris", address: "25 Avenue Pierre de Coubertin, 75013 Paris", date: Date.new(2024, 8, 25), time: Time.new(2024, 8, 25, 10, 0, 0), cost: 45.0, image_path: "ping pong vector image_card homepage.png", description: "Le prestigieux tournoi France Bad, mettant en vedette les meilleurs du sport.", number_of_teams: 9, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721636293/gzvvcfkuabbvvzvsgtcl.png" },
      { name: "Lyon Bad", city: "Lyon", address: "8 Avenue Jean Mermoz, 69008 Lyon", date: Date.new(2024, 9, 20), time: Time.new(2024, 9, 20, 11, 0, 0), cost: 50.0, image_path: "ping pong vector image_card homepage.png", description: "Le passionnant tournoi Lyon Bad, un événement majeur pour les fans de badminton.", number_of_teams: 7, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721636293/gzvvcfkuabbvvzvsgtcl.png" },
      { name: "Paris Fest", city: "Paris", address: "5 Rue Léo Delibes, 75016 Paris", date: Date.new(2024, 10, 15), time: Time.new(2024, 10, 15, 13, 0, 0), cost: 55.0, image_path: "ping pong vector image_card homepage.png", description: "Le festif tournoi de badminton Paris Fest, célébré pour son atmosphère vibrante.", number_of_teams: 8, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721636293/gzvvcfkuabbvvzvsgtcl.png" }
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
      number_of_teams: competition_data[:number_of_teams],
      address: competition_data[:address],
      created_at: Time.now,
      updated_at: Time.now,
      date: competition_data[:date],
      time: competition_data[:time],
      cost: competition_data[:cost],
      description: competition_data[:description],
      city: competition_data[:city],
      image_url: competition_data[:image_url]
    )

    # Attach image using ActiveStorage
    file_path = Rails.root.join("app/assets/images/#{competition_data[:image_path]}")
    competition.image.attach(io: File.open(file_path), filename: competition_data[:image_path])

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

# Vérification des coordonnées géocodées
Competition.all.each do |competition|
  puts "#{competition.name}: #{competition.latitude}, #{competition.longitude}"
end
