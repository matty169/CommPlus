# Create the center node, that has no name and the skills are its children
# Each skill has a name, and with that name we peform a search with it.
# An array of relevant skills is returned, and we iterate through the results and get the user associated to it and then get their name.

json.name ""
json.children do
	json.array!(@skills) do |skill|
		json.name skill.name
		json.children do
			json.array!(Skill.search(skill.name)) do |result|
				json.name result.user.name
			end
		end
	end
end

