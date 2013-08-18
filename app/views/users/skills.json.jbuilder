json.nodes do	#Create the array called nodes.
	json.array!(@user.skills) do |skill|
		json.extract! skill, :teach
		json.skill skill.name
		json.size 5	# Size is used because it allows a level of abstraction so that the javascipt doesnt have to be secific.
	end
end