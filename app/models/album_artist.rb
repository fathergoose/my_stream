class AlbumArtist < ActiveRecord::Base
  # artist_id
  # album_id
  belongs_to :artist
  belongs_to :album
end
