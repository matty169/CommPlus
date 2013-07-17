json.array!(@events) do |event|
  json.extract! event, :name, :date, :time, :location, :description, :attendee_id
  json.url event_url(event, format: :json)
end
