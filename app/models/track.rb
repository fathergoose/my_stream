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
end
