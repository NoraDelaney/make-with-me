class ArtistType < ActiveRecord::Base
  validates :name, presence: true
end
