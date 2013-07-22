# not sure when to implement host


json.extract! @event, :name, :description, :time, :date, :location, :photo_url
json.attendees @event.attendees do |attendee|
 json.name attendee.user.name
 json.user_id attendee.user.id
 json.photo_url attendee.user.photo_url

 json.skills attendee.user.skills.where(teach:true) do |skill|		#perform a query on the skill type. This is the power of ruby.
  	json.array! skill.name
  end
end