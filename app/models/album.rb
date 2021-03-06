# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  has_many :album_artists
  has_many :artists, through: :album_artists
  has_many :tracks
  belongs_to :user

end
