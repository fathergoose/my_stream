json.array! @albums do |album|
  json.id album.id
  json.title album.title
  json.userId album.user_id
  json.tracks album.tracks do |track|
    json.title track.title
    json.url track.path.url
  end
end
