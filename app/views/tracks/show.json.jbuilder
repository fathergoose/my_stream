json.trackNumber @track.track_number
json.title @track.title
json.artist @track.artists.first.name
json.album @track.album.title
json.url @track.path.url
json.id @track.id
