json.extract! @user, :name, :description, :photo_url, :location, :is_male

json.skillsOffer @user.skills.where(teach:true) do |skill|		# Make an array of Skill called skillOffer. Has a query filter.
 json.skill_id skill.id
 json.name skill.name
 json.numb_events skill.numb_events
 #json.teach skill.teach						# May not be necessary since it is already filtered.
end

json.skillsLearn @user.skills.where(teach:false) do |skill|
 json.skill_id skill.id
 json.name skill.name
 json.numb_events skill.numb_events
 #json.teach skill.teach
end

json.word_cloud @user.tags do |tag|
 json.array! tag.name								# Get the tag and place into an array of string called word_cloud.
end