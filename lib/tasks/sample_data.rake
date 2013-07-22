namespace :db do
  desc "Fill database with sample data"


  task populate: :environment do

    # Create matthew
    matthew = User.create!(email: "looi.matthew1@gmail.com", password: "password", password_confirmation: "password")
    matthew.update(name: "Matthew Looi", description: "He loves Simon Sinek", is_male: true, location: "Glenvista, JHB", photo_url: "http://profile.ak.fbcdn.net/hprofile-ak-ash4/c76.491.462.462/s160x160/1006183_10151439849650925_172684630_n.jpg")
    matthew.tags.create!(name: "Passionate")
    matthew.tags.create!(name: "iNspiration")
    matthew.tags.create!(name: "Parkour")
    matthew.tags.create!(name: "Live Life")
    matthew.tags.create!(name: "Simon Sinek")
    matthew.tags.create!(name: "Dreamer")
    matthew.tags.create!(name: "Like Always")

    parkour = matthew.skills.create!(teach: true, name: "Parkour", description: "Hay there I need to run up a wall")
    matthew.skills.create!(teach: true, name: "Squash", description: "Hay there I need to run up a wall")
    program = matthew.skills.create!(teach: true, name: "Ruby on Rails", description: "Hay there I need to run up a wall")
    matthew.skills.create!(teach: false, name: "Android", description: "Hay there I need to run up a wall")
    matthew.skills.create!(teach: false, name: "Mandarin", description: "Hay there I need to run up a wall")
    matthew.skills.create!(teach: false, name: "Ruby on Rails", description: "Hay there I need to run up a wall")


    # Create Jack
    jack = User.create!(email: "jacktalo0@gmail.com", password: "password", password_confirmation: "password")
    jack.update(name: "Jackline Atsango", description: "I love cheesecake", is_male: false, location: "Northcliff, JHB", photo_url: "http://sphotos-a.ak.fbcdn.net/hphotos-ak-ash4/2175_63289166659_1264_n.jpg")
    jack.tags.create!(name: "Passionate")
    jack.tags.create!(name: "iNspiration")
    jack.tags.create!(name: "Parkour")
    jack.tags.create!(name: "Live Life")
    jack.tags.create!(name: "Simon Sinek")
    jack.tags.create!(name: "Dreamer")
    jack.tags.create!(name: "Like Always")
    jack.skills.create!(teach: true, name: "Yoga", description: "Hay there I need to run up a wall")
    jack.skills.create!(teach: true, name: "Running", description: "Hay there I need to run up a wall")
    jack.skills.create!(teach: true, name: "Meditation", description: "Hay there I need to run up a wall")
    jack.skills.create!(teach: false, name: "German", description: "Hay there I need to run up a wall")
    jack.skills.create!(teach: false, name: "Zulu", description: "Hay there I need to run up a wall")
    jack.skills.create!(teach: false, name: "French", description: "Hay there I need to run up a wall")


    #Create James
    james = User.create!(email: "james@gmail.com", password: "password", password_confirmation: "password")
    james.update(name: "James Allingham", description: "I love cheesecake", is_male: true, location: "Parkview, JHB", photo_url: "http://aiti.mit.edu/media/cache/94/4b/944b049123db55195de6c5e3d87f2ae9.jpg")
    james.tags.create!(name: "Passionate")
    james.tags.create!(name: "iNspiration")
    james.tags.create!(name: "Parkour")
    james.tags.create!(name: "Live Life")
    james.tags.create!(name: "Simon Sinek")
    james.tags.create!(name: "Dreamer")
    james.tags.create!(name: "Like Always")
    james.skills.create!(teach: true, name: "Android", description: "Hay there I need to run up a wall")
    james.skills.create!(teach: true, name: "Engineering", description: "Hay there I need to run up a wall")
    james.skills.create!(teach: true, name: "Guitar", description: "Hay there I need to run up a wall")
    james.skills.create!(teach: false, name: "Android", description: "Hay there I need to run up a wall")
    james.skills.create!(teach: false, name: "Mandarin", description: "Hay there I need to run up a wall")
    james.skills.create!(teach: false, name: "Ruby on Rails", description: "Hay there I need to run up a wall")

    # Create Merelda
    merelda = User.create!(email: "mereldawu@gmail.com", password: "password", password_confirmation: "password")
    merelda.update(name: "Merelda Wu", description: "I love cheesecake", is_male: false, location: "Edenvale, JHB", photo_url: "http://sphotos-a.ak.fbcdn.net/hphotos-ak-ash4/2175_63289166659_1264_n.jpg")
    merelda.tags.create!(name: "Passionate")
    merelda.tags.create!(name: "iNspiration")
    merelda.tags.create!(name: "Parkour")
    merelda.tags.create!(name: "Live Life")
    merelda.tags.create!(name: "Simon Sinek")
    merelda.tags.create!(name: "Dreamer")
    merelda.tags.create!(name: "Like Always")
    merelda.skills.create!(teach: true, name: "Fashiom", description: "Hay there I need to run up a wall")
    merelda.skills.create!(teach: true, name: "Android", description: "Hay there I need to run up a wall")
    merelda.skills.create!(teach: true, name: "Baking", description: "Hay there I need to run up a wall")
    merelda.skills.create!(teach: false, name: "Parkour", description: "Hay there I need to run up a wall")
    merelda.skills.create!(teach: false, name: "Skydiving", description: "Hay there I need to run up a wall")
    merelda.skills.create!(teach: false, name: "Squash", description: "Hay there I need to run up a wall")

    # Create Zah
    zah = User.create!(email: "zah@gmail.com", password: "password", password_confirmation: "password")
    zah.update(name: "Zahira Bhumjee", description: "I love cheesecake", is_male: false, location: "Kylami, JHB", photo_url: "http://profile.ak.fbcdn.net/hprofile-ak-frc3/c44.44.552.552/s160x160/1011307_10152961840670082_1660923073_n.jpg")
    zah.tags.create!(name: "Passionate")
    zah.tags.create!(name: "iNspiration")
    zah.tags.create!(name: "Parkour")
    zah.tags.create!(name: "Live Life")
    zah.tags.create!(name: "Simon Sinek")
    zah.tags.create!(name: "Dreamer")
    zah.tags.create!(name: "Like Always")
    zah.skills.create!(teach: true, name: "Fashion", description: "Hay there I need to run up a wall")
    zah.skills.create!(teach: true, name: "Makeup", description: "Hay there I need to run up a wall")
    zah.skills.create!(teach: true, name: "Blogging", description: "Hay there I need to run up a wall")
    zah.skills.create!(teach: false, name: "Css", description: "Hay there I need to run up a wall")
    zah.skills.create!(teach: false, name: "HTML", description: "Hay there I need to run up a wall")
    zah.skills.create!(teach: false, name: "Web Design", description: "Hay there I need to run up a wall")

    # Create Robert
    robert = User.create!(email: "robertlouw@gmail.com", password: "password", password_confirmation: "password")
    robert.update(name: "Robert Louw", description: "I love cheesecake", is_male: true, location: "Linded, JHB", photo_url: "http://profile.ak.fbcdn.net/hprofile-ak-ash4/c36.36.447.447/s160x160/1004596_599462753418308_108864779_n.jpg")
    robert.tags.create!(name: "Passionate")
    robert.tags.create!(name: "iNspiration")
    robert.tags.create!(name: "Parkour")
    robert.tags.create!(name: "Live Life")
    robert.tags.create!(name: "Simon Sinek")
    robert.tags.create!(name: "Dreamer")
    robert.tags.create!(name: "Like Always")
    robert.skills.create!(teach: true, name: "Parkour", description: "Hay there I need to run up a wall")
    robert.skills.create!(teach: true, name: "Guitar", description: "Hay there I need to run up a wall")
    robert.skills.create!(teach: true, name: "Swimming", description: "Hay there I need to run up a wall")
    robert.skills.create!(teach: false, name: "Parkour", description: "Hay there I need to run up a wall")
    robert.skills.create!(teach: false, name: "Drums", description: "Hay there I need to run up a wall")
    robert.skills.create!(teach: false, name: "Baking", description: "Hay there I need to run up a wall")

    # Create Matt
    matt = User.create!(email: "mat@gmail.com", password: "password", password_confirmation: "password")
    matt.update(name: "Matt McAfee", description: "I love cheesecake", is_male: true, location: "Sandton, JHB", photo_url: "http://profile.ak.fbcdn.net/hprofile-ak-prn2/c83.30.371.371/s160x160/168257_10151485256129818_1098145458_n.jpg")
    matt.tags.create!(name: "Passionate")
    matt.tags.create!(name: "iNspiration")
    matt.tags.create!(name: "Parkour")
    matt.tags.create!(name: "Live Life")
    matt.tags.create!(name: "Simon Sinek")
    matt.tags.create!(name: "Dreamer")
    matt.tags.create!(name: "Like Always")
    matt.skills.create!(teach: true, name: "Banjo", description: "Hay there I need to run up a wall")
    matt.skills.create!(teach: true, name: "Ballet", description: "Hay there I need to run up a wall")
    matt.skills.create!(teach: true, name: "Driving", description: "Hay there I need to run up a wall")
    matt.skills.create!(teach: false, name: "Parkour", description: "Hay there I need to run up a wall")
    matt.skills.create!(teach: false, name: "Gymnastics", description: "Hay there I need to run up a wall")
    matt.skills.create!(teach: false, name: "Running", description: "Hay there I need to run up a wall")



    # Create Events

    hack = Event.create!(name: "Hackathon", location: "Wits, D-lab", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSQR71HEKbVeGmfi-Ddy9LJFdXSFkaMjEgE8GIFor_3net_7s9SyQ", host_id: matthew.id)
    ruby = Event.create!(name: "Ruby Lesson", location: "Wits, D-lab", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: " http://www.firstlinesoftware.com/wp-content/uploads/2013/03/ruby-vs-php.jpg", host_id: matthew.id)
    parkoursaterday = Event.create!(name: "Parkour Intro", location: "Wits Red Brick", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQRvrhE_fJWTZfEBwEzlRt96DlFCs3285jKJpgGBioposGJ5SF0", host_id: matthew.id)
    bakeaway = Event.create!(name: "Macaroon Baking", location: "Robs House", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "http://distilleryimage0.ak.instagram.com/9e4850a2d5d011e2939b22000a1f9251_7.jpg", host_id: matthew.id)
    codencofee = Event.create!(name: "Code n Coffee", location: "Mug n Bean", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "http://www-andrewspittle-net.zippykid.netdna-cdn.com/wp-content/uploads/2013/02/coffee-and-code-1200x803.jpg", host_id: matthew.id)
    tennis = Event.create!(name: "Tennis Lessons", location: "Wits Tennis Courts", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR-SiaYEftSy9JeGhb7TUO0fag5XMFxx80-CACg5K4sNJXidfKvSg", host_id: matthew.id)
    yoga = Event.create!(name: "Fun in the Sun Yoga", location: "Wits", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQPKEhp1rdR0ZkUXOpO8doIXoXiMOrDkFTWQTyjz6M4Iy0q1Gtseg", host_id: matthew.id)
    demoday = Event.create!(name: "MIT Demo Day", location: "Wits, Alumni House", date: "2013-07-29", time: "12:00", description: "This is going to be a long weeked", photo_url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTRst7sKKANLkoXQrp9Xoeej7u9sSe_iY8NuC-Pd8a4CUGK8Rql", host_id: matthew.id)

    # Create Attendees # have not implemmented skill_id properly
    Attendee.create!(event_id: hack.id, user_id: matthew.id, skill_id: program.id)
    Attendee.create!(event_id: hack.id, user_id: james.id, skill_id: parkour.id)
    Attendee.create!(event_id: hack.id, user_id: merelda.id, skill_id: program.id)

    Attendee.create!(event_id: ruby.id, user_id: matthew.id, skill_id: parkour.id)
    Attendee.create!(event_id: ruby.id, user_id: james.id, skill_id: program.id)
    Attendee.create!(event_id: ruby.id, user_id: merelda.id, skill_id: parkour.id)

    Attendee.create!(event_id: parkoursaterday.id, user_id: jack.id, skill_id: program.id)
    Attendee.create!(event_id: parkoursaterday.id, user_id: matt.id, skill_id: parkour.id)

    Attendee.create!(event_id: bakeaway.id, user_id: matthew.id, skill_id: program.id)
    Attendee.create!(event_id: bakeaway.id, user_id: jack.id, skill_id: parkour.id)
    Attendee.create!(event_id: bakeaway.id, user_id: james.id, skill_id: program.id)
    Attendee.create!(event_id: bakeaway.id, user_id: merelda.id, skill_id: parkour.id)
    Attendee.create!(event_id: bakeaway.id, user_id: robert.id, skill_id: program.id)
    Attendee.create!(event_id: bakeaway.id, user_id: matt.id, skill_id: parkour.id)
    Attendee.create!(event_id: bakeaway.id, user_id: zah.id, skill_id: parkour.id)

    Attendee.create!(event_id: codencofee.id, user_id: matthew.id, skill_id: parkour.id)
    Attendee.create!(event_id: codencofee.id, user_id: james.id, skill_id: program.id)
    Attendee.create!(event_id: codencofee.id, user_id: merelda.id, skill_id: parkour.id)

    Attendee.create!(event_id: tennis.id, user_id: matthew.id, skill_id: parkour.id)

    Attendee.create!(event_id: yoga.id, user_id: matthew.id, skill_id: program.id)
    Attendee.create!(event_id: yoga.id, user_id: jack.id, skill_id: parkour.id)
    Attendee.create!(event_id: yoga.id, user_id: james.id, skill_id: program.id)
    Attendee.create!(event_id: yoga.id, user_id: merelda.id, skill_id: parkour.id)
    Attendee.create!(event_id: yoga.id, user_id: robert.id, skill_id: program.id)
    Attendee.create!(event_id: yoga.id, user_id: matt.id, skill_id: parkour.id)
    Attendee.create!(event_id: yoga.id, user_id: zah.id, skill_id: parkour.id)

    Attendee.create!(event_id: demoday.id, user_id: matthew.id, skill_id: parkour.id)
    Attendee.create!(event_id: demoday.id, user_id: james.id, skill_id: program.id)
    Attendee.create!(event_id: demoday.id, user_id: merelda.id, skill_id: parkour.id)

  end
end