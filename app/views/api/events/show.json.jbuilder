# not sure when to implement host
json.extract! @event, :name, :description, :date, :location, :photo_url #, :host_id
#json.host_name User.find_by_id(@event.host_id).name
json.time @event.time.to_s
json.attendees @event.attendees do |attendee|
 json.name attendee.user.name
 json.id attendee.user.id
 json.photo_url attendee.user.photo_url

 # This is backwards!
 json.skills attendee.user.skills.where(teach:true) do |skill|		#perform a query on the skill type. This is the power of ruby.
  	json.array! skill.name 
  end
end