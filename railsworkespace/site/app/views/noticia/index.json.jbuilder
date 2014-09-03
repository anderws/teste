json.array!(@noticia) do |noticium|
  json.extract! noticium, :id, :titulo, :texto
  json.url noticium_url(noticium, format: :json)
end
