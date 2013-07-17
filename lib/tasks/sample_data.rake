namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Matthew Looi",
                 description: "He loves Simon Sinek")
    99.times do |n|
      name  = Faker::Name.name
      desc = Faker::Lorem.sentence(sentence_count = 3)
      User.create!(name: name,
                   description: desc)
    end
  end
end