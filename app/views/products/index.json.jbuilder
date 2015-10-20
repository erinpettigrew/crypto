json.array!(@products) do |product|
  json.extract! product, :id, :product_brand, :product_name
  json.url product_url(product, format: :json)
end
