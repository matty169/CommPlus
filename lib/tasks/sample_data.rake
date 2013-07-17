namespace :db do
  desc "Fill database with sample data"


  task populate: :environment do
    matthew = User.create!(name: "Matthew Looi",
                 description: "He loves Simon Sinek")
    Skill.create(user_id: matthew.id, teach: true, name: "Parkour", description: "Hay there I need to run up a wall")
    Skill.create(user_id: matthew.id, teach: false, name: "Programming", description: "Ruby on rails is difficult")
    99.times do |n|
      name  = Faker::Name.name
      desc = Faker::Lorem.sentence(sentence_count = 3)
      dummy = User.create!(name: name,
                   description: desc)
      desc = Faker::Lorem.sentence(sentence_count = 3)
      name  = Faker::Name.name
      dummy.skills.create(user_id: dummy.id, teach: true, name: name, description: desc)
      desc = Faker::Lorem.sentence(sentence_count = 3)
      name  = Faker::Name.name
      dummy.skills.create(user_id: dummy.id, teach: false, name: name, description: desc)
    end
  end
end