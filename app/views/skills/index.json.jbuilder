json.array!(@skills) do |skill|
  json.extract! skill, :teach, :name, :description, :numb_events
  json.url skill_url(skill, format: :json)
end
