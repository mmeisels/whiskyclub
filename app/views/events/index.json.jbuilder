json.array!(@events) do |event|
  json.extract! event, :id,:color, :title, :description
  json.start event.start_time
  json.url event_url(event, format: :html)
end
