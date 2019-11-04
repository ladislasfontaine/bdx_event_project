User.destroy_all
Event.destroy_all

users = []
events = []

30.times do |index|
  first_name = Faker::Name.first_name
  users << User.create!(first_name: first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, email: (first_name.downcase + "@yopmail.com"))
end

15.times do |index|
  events << Event.create!(start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 60), duration: (rand(6..48) * 5), title: Faker::Beer.brand, description: Faker::Hipster.sentence, price: rand(1..1000), location: "Bordeaux", user: users.sample)
end

50.times do |index|
  Attendance.create(user: users.sample, event: events.sample)
end
