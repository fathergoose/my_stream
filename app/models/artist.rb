# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ActiveRecord::Base
  has_many :album_artists
  has_many :albums, through: :album_artists
  has_many :track_artists
  has_many :tracks, through: :track_artists
  belongs_to :user
end
