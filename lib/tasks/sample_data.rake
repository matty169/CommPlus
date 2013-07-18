namespace :db do
  desc "Fill database with sample data"


  task populate: :environment do
    matthew = User.create!(name: "Matthew Looi",
                 description: "He loves Simon Sinek")
    parkour = Skill.create!(user_id: matthew.id, teach: true, name: "Parkour", description: "Hay there I need to run up a wall")
    program = Skill.create!(user_id: matthew.id, teach: false, name: "Programming", description: "Ruby on rails is difficult")

    hack = Event.create!(name: "Hackathon", location: "Wits", description: "This is going to be a long weeked")
    ruby = Event.create!(name: "Ruby Lesson", location: "Wits", description: "This is going to be a long weeked")
    #parkour_atendees = Attendee.create!(user_id: matthew.id)
    ruby_atendees = Attendee.create!(event_id: ruby.id, user_id: matthew.id, skill_id: program.id)
    hackathon_atendees = Attendee.create!(event_id: hack.id, user_id: matthew.id, skill_id: parkour.id)

    # 99.times do |n|

    #   # Creating a User called Dummy
    #   name  = Faker::Name.name
    #   desc = Faker::Lorem.sentence(sentence_count = 3)
    #   dummy = User.create!(name: name,
    #                description: desc)

    #   # Creating a Skill Teach called 
    #   desc = Faker::Lorem.sentence(sentence_count = 3)
    #   name  = Faker::Name.name
    #   dummy.skills.create(user_id: dummy.id, teach: true, name: name, description: desc)
    #   # Creating a Skill Teach called 
    #   desc = Faker::Lorem.sentence(sentence_count = 3)
    #   name  = Faker::Name.name
    #   dummy.skills.create(user_id: dummy.id, teach: false, name: name, description: desc)

    #   # Creating a Atendee list for event
    #   Attendee.create!(event_id: hack.id, user_id: dummy.id)
    # end
    # soccer = Event.create!(name: "Soccer Lesson", location: "Wits", description: "This is going to be a long weeked")
    # 10.times do |n|
    #   name  = Faker::Name.name
    #   desc = Faker::Lorem.sentence(sentence_count = 3)
    #   dummy = User.create!(name: name,
    #                description: desc)
    #   desc = Faker::Lorem.sentence(sentence_count = 3)
    #   name  = Faker::Name.name
    #   dummy.skills.create(user_id: dummy.id, teach: true, name: name, description: desc)
    #   desc = Faker::Lorem.sentence(sentence_count = 3)
    #   name  = Faker::Name.name
    #   dummy.skills.create(user_id: dummy.id, teach: false, name: name, description: desc)
    #   Attendee.create!(event_id: soccer.id, user_id: dummy.id)
    # end



  end
end