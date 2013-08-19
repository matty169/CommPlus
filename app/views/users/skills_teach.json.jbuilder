json.nodes do	#Create the array called nodes.
	json.array!(@user.skills.where(teach: true)) do |skill|
		json.extract! skill, :teach
		json.skill skill.name
		json.url skill.base_uri
		json.size 5	# Size is used because it allows a level of abstraction so that the javascipt doesnt have to be secific.
	end
end