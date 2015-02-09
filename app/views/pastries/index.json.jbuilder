json.array!(@pastries) do |pastry|
  json.extract! pastry, :id, :name, :price, :quantity
  json.url pastry_url(pastry, format: :json)
end
