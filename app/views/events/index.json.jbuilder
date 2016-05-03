json.array!(@events) do |event|
  json.extract! event, :id, :name, :start_datetime, :end_datetime, :description, :maximum_quantity
  json.url event_url(event, format: :json)
end
