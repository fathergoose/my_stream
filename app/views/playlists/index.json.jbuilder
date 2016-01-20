json.array! @playlists do |playlist|
  json.id playlist.id
  json.userId playlist.user_id
  json.title playlist.name
  json.notes playlist.notes
  json.tracks playlist.tracks do |track|
    json.title track.title
    json.artist track.artists.first.name
    json.url track.path.url
    json.id track.id
  end
end
