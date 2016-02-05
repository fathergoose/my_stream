class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tracks
  has_many :playlists
  has_many :albums
  has_many :artists
  def short_name
    email[/[^@]+/]
  end
end
