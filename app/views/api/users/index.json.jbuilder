json.array!(@users) do |user|
  json.extract! user, :id, :name
  json.skills user.skills do |skill|
  	json.name skill.name
  end
end
