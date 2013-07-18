json.extract! @user, :name, :description
json.skills @user.skills do |skill|
 json.skill_id skill.id
 json.name skill.name
 json.numb_events skill.numb_events
end