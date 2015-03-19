json.array!(@todos) do |todo|
  json.extract! todo, :id, :text, :done, :deleted
  json.url todo_url(todo, format: :json)
end
