# db/seeds.rb

require 'faker'

# Clear existing data
Message.destroy_all
Chatroom.destroy_all
Team.destroy_all
Competition.destroy_all
Sport.destroy_all
User.destroy_all

# Array of user data
users_data = [
  { email: "hello@hotmail.com", password: "123456", password_confirmation: "123456" },
  { email: "hello1@hotmail.com", password: "123456", password_confirmation: "123456" },
  { email: "hello2@hotmail.com", password: "123456", password_confirmation: "123456" }
]

# Create users
users_data.each do |user_data|
  user = User.create!(
    email: user_data[:email],
    password: user_data[:password],
    password_confirmation: user_data[:password_confirmation],
    created_at: Time.now,
    updated_at: Time.now
  )

  puts "User created with email: #{user.email}"

  # Create sports, competitions, and teams for each user
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
    sport = Sport.create!(
      name: sport_data[:name],
      created_at: Time.now,
      updated_at: Time.now
    )

    puts "Sport created: #{sport.name}"

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
      competition.number_of_teams.times do
        Team.create!(
          owner_id: User.all.sample.id, # Assign a random user as the owner of the team
          competition: competition,
          number_max_of_participants: rand(5..15),
          created_at: Time.now,
          updated_at: Time.now
        )
      end
    end
  end
end

puts "Seed completed successfully."
