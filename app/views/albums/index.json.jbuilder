json.array! @albums do |album|
  json.id album.id
  json.userId album.user_id
  json.title album.title
  json.artist album.artists.first
  json.tracks album.tracks do |track|
    json.title track.title
    json.url track.path.url
    json.trackNumber track.track_number
  end
end
