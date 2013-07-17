json.array!(@attendees) do |attendee|
  json.extract! attendee, :event_id, :user_id_string, :skill_id
  json.url attendee_url(attendee, format: :json)
end
