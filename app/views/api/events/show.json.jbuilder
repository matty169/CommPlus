# not sure when to implement host
json.extract! @event, :name, :description, :date, :location, :photo_url #, :host_id
#json.host_name User.find_by_id(@event.host_id).name
json.time @event.time.to_s
# This is to check if the current logged in user is attending the event or not.
# It return 0 for not attending otherwise returns the attendee_id.
json.attendee_id @event.attendee_id(current_user)
json.attendees @event.attendees do |attendee|
 json.name attendee.user.name
 # This ID field is for the User_id and the naming convention should change in future.
 json.id attendee.user.id
 json.photo_url attendee.user.photo_url

 # This is backwards!
 json.skills attendee.user.skills.where(teach:true) do |skill|		#perform a query on the skill type. This is the power of ruby.
  	json.array! skill.name 
  end
end