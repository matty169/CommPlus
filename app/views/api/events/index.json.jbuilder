json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :location
end
