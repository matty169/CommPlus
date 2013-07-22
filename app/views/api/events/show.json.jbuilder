# not sure when to implement host
json.extract! @event, :name, :description, :location, :photo_url, :host_id
json.attendees @event.attendees do |attendee|
 json.name attendee.user.name
 json.user_id attendee.user.id
 json.photo_url attendee.user.photo_url

 json.skills attendee.user.skills.where(teach:true) do |skill|		#perform a query on the skill type. This is the power of ruby.
  	json.array! skill.name
  end
end