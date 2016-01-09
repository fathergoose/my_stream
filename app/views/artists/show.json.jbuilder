json.id @artist.id
json.name @artist.name
json.albums @artist.albums do |album|
  json.title album.title
  json.tracks album.tracks do |track|
    json.title track.title
    json.trackNumber track.track_number
  end
end
