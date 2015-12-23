# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  title        :string
#  artist_id    :integer
#  album_id     :integer
#  year         :integer
#  track_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  path         :string
#

class Track < ActiveRecord::Base
  mount_uploader :path, PathUploader
  has_many :track_albums
  has_many :albums, through: :track_albums
  has_many :track_artists
  has_many :artists, through: :track_artists

  require 'audioinfo'
  def save_tags!(track_id)
    AudioInfo.open('/Users/acltc/acltc/capstone_stuff/my_stream/public'+path.to_s) do |info|
      update(
        title: info.title, 
      )
      @artist = Artist.find_by(name: info.artist)
      if(@artist)
        TrackArtist.create(artist_id: @artist.id, track_id: track_id)
      else
        @artist = Artist.create(name: info.artist)
        TrackArtist.create(artist_id: @artist.id, track_id: track_id)
      end
    end
  end
     
end
