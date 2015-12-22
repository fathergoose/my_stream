# == Schema Information
#
# Table name: album_artists
#
#  id         :integer          not null, primary key
#  artist_id  :integer
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AlbumArtist < ActiveRecord::Base
  # artist_id
  # album_id
  belongs_to :artist
  belongs_to :album
end
