json.array! @tracks do |track|
  json.id track.id
  json.title track.title
  json.url track.path.url
  json.artist track.artists.first.name
end
