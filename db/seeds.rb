require 'faker'
require 'open-uri'

Faker::Config.locale = 'fr'

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

# Create 30 other users with random first names
30.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password",
    name: Faker::Name.first_name
  )
end

puts "30 additional users created successfully."

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
  "Champion de club",
  "Vainqueur de tournoi international",
  "Finaliste de tournoi national",
  "Médaillé d'or aux Jeux Olympiques",
  "Médaillé d'argent aux Jeux Olympiques",
  "Médaillé de bronze aux Jeux Olympiques",
  "Vainqueur de la Coupe du Monde",
  "Champion universitaire",
  "Champion scolaire",
  "Vainqueur de la Coupe nationale",
  "Vainqueur du Championnat national",
  "Champion interclubs",
  "Vainqueur de la Ligue régionale",
  "Vainqueur de la Coupe régionale",
  "Vainqueur de la Coupe départementale",
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

  %w[tennis badminton].each do |sport|
    UserSport.create!(
      user: user,
      sport: sports[sport.to_sym],
      level: rand(1..5000),
      palmares: palmares_values.sample,
      created_at: Time.now,
      updated_at: Time.now
    )
    puts "#{sport.capitalize} assigned to user with level and palmares."
  end
end

# Team names
team_names = [
  "Étoiles Filantes", "Champions Suprêmes", "Guerriers Vaillants", "Conquérants Brillants",
  "Stratèges Épiques", "Phénix Enflammés", "Dynamiques Puissants", "Héros Solaires",
  "Paladins Mystiques", "Alchimistes Sombres", "Arcanes Éternels", "Chevaliers Hardis",
  "Titans Majestueux", "Légendes Glorieuses", "Nobles Vaillants", "Flammes Ardentes",
  "Maîtres Foudroyants", "Éclair Fulminant", "Élus Célestes", "Phénomènes Épiques",
  "Gardiens Radieux", "Sorciers Sereins", "Voyants Sages", "Médaillés Dorés",
  "Triomphateurs Glorieux", "Champions Victorieux", "Dynamos Héroïques", "Héritiers Puissants",
  "Stratèges Inoubliables", "Magiciens Mystiques", "Luminaires Éblouissants",
  "Alchimistes Légendaires", "Sphinx Mystiques", "Invincibles Conquérants",
  "Philosophes Enflammés", "Aventuriers Brillants", "Tridents Féroces",
  "Flammes Solitaires", "Étincelles Radieuses", "Néons Incandescents", "Gardiens Émérites",
  "Noblesse Hardie", "Philosophes Audacieux", "Chevaliers Dorés", "Architectes Foudroyants",
  "Dynamos Enragés", "Paladins Épiques", "Triomphateurs Suprêmes", "Tempêtes Hivernales",
  "Glaciers Solides", "Constellations Radieuses", "Magiciens Hardis", "Sphinx Enflammés",
  "Flammes Mystiques", "Chevaliers Radieux", "Constellations Éternelles", "Noblesse Céleste",
  "Dynamiques Glorieux", "Phénix Glorieux", "Flèches Célestes", "Tigres Sauvages",
  "Lions Indomptables", "Dragons Rouges", "Panthères Noires", "Aigles Dorés",
  "Loups Blancs", "Requins Bleus", "Faucons Rapides", "Lynx Sombres",
  "Cobras Jaunes", "Pumas Gracieux", "Éperviers Hardis", "Mustangs Sauvages",
  "Vautours Implacables", "Bélougas Vaillants", "Scorpions Nocturnes", "Serpents Silencieux",
  "Éléphants Majestueux", "Rhinos Puissants", "Albatros Géants",
  "Étoiles du Matin", "Champions de Demain", "Guerriers de Lumière", "Conquérants du Ciel",
  "Stratèges de Feu", "Phénix des Étoiles", "Dynamiques de Glace", "Héros de Soleil",
  "Paladins de l’Ombre", "Alchimistes du Temps", "Arcanes de Cristal", "Chevaliers des Abysses",
  "Titans de l’Univers", "Légendes du Futur", "Nobles de l’Olympe", "Flammes de la Nuit",
  "Maîtres des Tempêtes", "Éclair du Nord", "Élus des Ombres", "Phénomènes du Zénith",
  "Gardiens des Rêves", "Sorciers de l’Aurore", "Voyants de l’Orient", "Médaillés de Gloire",
  "Triomphateurs des Montagnes", "Champions de l’Olympe", "Dynamos de l’Enfer", "Héritiers des Cieux",
  "Stratèges du Crépuscule", "Magiciens de Minuit"
]

# Create competitions and teams for each sport
sports_with_competitions = [
  {
    name: "Tennis",
    competitions: [
      { name: "Roland Garros", city: "Paris", address: "2 Avenue Gordon Bennett, 75016 Paris", date: Date.new(2025, 5, 30), time: Time.new(2025, 5, 30, 14, 0, 0), cost: 100.0, latitude: 48.847, longitude: 2.249, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486534/tennis_card_rhklbe.png", description: "Le prestigieux tournoi Roland Garros du calendrier tennistique.", number_of_teams: 13 },
      { name: "Lyon Open", city: "Lyon", address: "155 Boulevard Stalingrad, 69006 Lyon", date: Date.new(2024, 6, 15), time: Time.new(2024, 6, 15, 10, 0, 0), cost: 50.0, latitude: 45.770, longitude: 4.860, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486534/tennis_card_rhklbe.png", description: "Un tournoi de tennis excitant à Lyon, réunissant les meilleurs talents.", number_of_teams: 6 },
      { name: "Paris Masters", city: "Paris", address: "8 Boulevard de Bercy, 75012 Paris", date: Date.new(2024, 7, 10), time: Time.new(2024, 7, 10, 16, 0, 0), cost: 75.0, latitude: 48.838, longitude: 2.380, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486534/tennis_card_rhklbe.png", description: "Le prestigieux Paris Masters, connu pour ses matchs compétitifs.", number_of_teams: 7 }
    ]
  },
  {
    name: "Padel",
    competitions: [
      { name: "Padel Cup Lyon", city: "Lyon", address: "66 Avenue Paul Santy, 69008 Lyon", date: Date.new(2024, 8, 20), time: Time.new(2024, 8, 20, 11, 0, 0), cost: 60.0, latitude: 45.740, longitude: 4.860, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486526/Padel_man_vector_card_homepage_vgwpyq.png", description: "La passionnante Padel Cup à Lyon, attirant des joueurs du monde entier.", number_of_teams: 15 },
      { name: "Padel Paris", city: "Paris", address: "10 Rue des Meuniers, 75012 Paris", date: Date.new(2024, 9, 15), time: Time.new(2024, 9, 15, 12, 0, 0), cost: 55.0, latitude: 48.840, longitude: 2.395, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486526/Padel_man_vector_card_homepage_vgwpyq.png", description: "Le palpitant tournoi de Padel Paris, un événement incontournable pour les passionnés.", number_of_teams: 6 },
      { name: "Marseille Open", city: "Marseille", address: "28 Boulevard de Pont de Vivaux, 13010 Marseille", date: Date.new(2024, 10, 10), time: Time.new(2024, 10, 10, 14, 0, 0), cost: 65.0, latitude: 43.280, longitude: 5.390, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486526/Padel_man_vector_card_homepage_vgwpyq.png", description: "Le défiant Open de Marseille, mettant en vedette des matchs de Padel de haut niveau.", number_of_teams: 7 }
    ]
  },
  {
    name: "Ping-pong",
    competitions: [
      { name: "Marseille Ping Tour", city: "Marseille", address: "40 Boulevard Charles Livon, 13007 Marseille", date: Date.new(2024, 10, 5), time: Time.new(2024, 10, 5, 13, 0, 0), cost: 40.0, latitude: 43.293, longitude: 5.361, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486525/ping_pong_vector_image_card_homepage_rdeoo4.png", description: "Le tournoi ultime de Ping-pong à Marseille, connu pour ses matchs intenses.", number_of_teams: 14 },
      { name: "Spin Lyon", city: "Lyon", address: "10 Rue Robert, 69006 Lyon", date: Date.new(2024, 11, 10), time: Time.new(2024, 11, 10, 14, 0, 0), cost: 30.0, latitude: 45.770, longitude: 4.850, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486525/ping_pong_vector_image_card_homepage_rdeoo4.png", description: "Le passionnant tournoi Spin Lyon, réunissant les meilleurs joueurs.", number_of_teams: 5 },
      { name: "Bordeaux Clash", city: "Bordeaux", address: "Cours de la Marne, 33800 Bordeaux", date: Date.new(2024, 12, 15), time: Time.new(2024, 12, 15, 9, 0, 0), cost: 35.0, latitude: 44.8378, longitude: -0.5792, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721486525/ping_pong_vector_image_card_homepage_rdeoo4.png", description: "Le tournoi compétitif Bordeaux Clash, attirant des joueurs de tout le pays.", number_of_teams: 7 }
    ]
  },
  {
    name: "Badminton",
    competitions: [
      { name: "France Badminton Open", city: "Paris", address: "25 Avenue Pierre de Coubertin, 75013 Paris", date: Date.new(2024, 8, 25), time: Time.new(2024, 8, 25, 10, 0, 0), cost: 45.0, latitude: 48.819, longitude: 2.361, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721636293/badminton_card.png", description: "Le prestigieux tournoi France Badminton Open, mettant en vedette les meilleurs du sport.", number_of_teams: 9 },
      { name: "Lyon Badminton Cup", city: "Lyon", address: "8 Avenue Jean Mermoz, 69008 Lyon", date: Date.new(2024, 9, 20), time: Time.new(2024, 9, 20, 11, 0, 0), cost: 50.0, latitude: 45.735, longitude: 4.889, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721636293/badminton_card.png", description: "Le passionnant tournoi Lyon Badminton Cup, un événement majeur pour les fans de badminton.", number_of_teams: 7 },
      { name: "Paris Badminton Fest", city: "Paris", address: "5 Rue Léo Delibes, 75016 Paris", date: Date.new(2024, 10, 15), time: Time.new(2024, 10, 15, 13, 0, 0), cost: 55.0, latitude: 48.866, longitude: 2.275, image_url: "https://res.cloudinary.com/dsj2h7qb7/image/upload/v1721636293/badminton_card.png", description: "Le festif tournoi de badminton Paris Fest, célébré pour son atmosphère vibrante.", number_of_teams: 8 }
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
      latitude: competition_data[:latitude],
      longitude: competition_data[:longitude],
      created_at: Time.now,
      updated_at: Time.now,
      date: competition_data[:date],
      time: competition_data[:time],
      cost: competition_data[:cost],
      description: competition_data[:description],
      city: competition_data[:city],
      image_url: competition_data[:image_url]
    )

    puts "Competition created: #{competition.name}"

    # Create teams for this competition with unique names
    used_names = []
    competition.number_of_teams.times do
      loop do
        team_name = team_names.sample
        unless used_names.include?(team_name)
          used_names << team_name
          break
        end
      end
      team = Team.create!(
        owner: User.all.sample, # Assign a random user as the owner of the team
        competition: competition,
        name: used_names.last,
        number_max_of_participants: rand(5..15),
        created_at: Time.now,
        updated_at: Time.now
      )

      # Ensure the owner has tennis and badminton levels
      %w[tennis badminton].each do |sport|
        unless team.owner.user_sports.exists?(sport: sports[sport.to_sym])
          UserSport.create!(
            user: team.owner,
            sport: sports[sport.to_sym],
            level: rand(1..5000),
            palmares: palmares_values.sample
          )
        end
      end

      puts "Team created: #{team.name} for competition: #{competition.name}"
    end
  end
end

puts "Seed completed successfully."

# Verify geocoded coordinates
Competition.all.each do |competition|
  puts "#{competition.name}: #{competition.latitude}, #{competition.longitude}"
end

# Ensure each user owns a maximum of 5 teams
User.all.each do |user|
  if user.owned_teams.count > 5
    user.owned_teams.order(created_at: :desc).limit(user.owned_teams.count - 5).destroy_all
  end
end
