json.array!(@cards) do |card|
  json.extract! card, :id, :make, :color, :year
  json.url card_url(card, format: :json)
end
