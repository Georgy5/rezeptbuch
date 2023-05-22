json.array! @recipes do |recipe|
  json.merge! recipe.attributes
end
