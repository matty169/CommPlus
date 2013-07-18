json.extract! @event, :name, :description, :time, :date, :location
json.attendees @event.attendees do |attendee|
 json.name attendee.user.name
 json.user_id attendee.user.id
 json.skill attendee.skill.name
end