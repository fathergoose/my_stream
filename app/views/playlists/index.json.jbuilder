json.array! @playlists do |playlist|
  json.id playlist.id
  json.userId playlist.user_id
  json.title playlist.name
  json.tracks playlist.tracks do |track|
    json.title track.title
    json.artist track.artists.first.name
    json.url track.path.url
  end
end
