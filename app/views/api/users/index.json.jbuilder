json.array!(@users) do |user|
  json.extract! user, :id, :name, :photo_url
  json.skills  user.skills.where(teach:true) do |skill|		#perform a query on the skill type. This is the power of ruby.
  	json.array! skill.name
  end
end


#some old code
#json.array!(@users) do |user|
#  json.extract! user, :id, :name
#  json.skills user.skills do |skill|
#  	json.name skill.name
#  end
#end

