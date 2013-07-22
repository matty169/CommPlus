json.array!(@events) do |event|
  json.extract! event, :id, :name, :date, :location, :photo_url
  json.time event.time.to_s
  json.attendee_count event.attendees.count
end
