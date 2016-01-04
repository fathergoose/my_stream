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

  belongs_to :user

  has_many :track_albums
  has_many :albums, through: :track_albums

  has_many :track_artists
  has_many :artists, through: :track_artists


  def self.user_tracks(user_id)
    where user_id: user_id
  end

  require 'audioinfo'
  def save_tags!(track_id)
    AudioInfo.open('public'+path.to_s) do |info|
      update(
        title: info.title,

      )
      @artist = Artist.find_by(name: info.artist) ## Look up rails find or create by 
      if(@artist)
        TrackArtist.create(artist_id: @artist.id, track_id: track_id)
      else
        @artist = Artist.create(name: info.artist)
        TrackArtist.create(artist_id: @artist.id, track_id: track_id)
      end
      @album = Album.find_by(title: info.album)
      if(@album)
        TrackAlbum.create(album_id: @album.id, track_id: track_id, tracknum: info.tracknum) # what is the ruby way to protect against null here?
      else
        @album = Album.create(title: info.album)
        TrackAlbum.create(album_id: @album.id, track_id: track_id, tracknum: info.tracknum)
      end

    end
  end

  before_save :update_track_attributes

  private

  def update_track_attributes
    if path.present? && path_changed?
      self.file_format = path.content_type
      self.file_size = path.file.size
    end
  end
  
  


     
end
