json.array! @artists do |artist|
  json.id artist.id
  json.name artist.name
  json.albums artist.albums do |album|
    json.title album.title
  end
end
