class ArtType < ActiveRecord::Base
  has_many :user_arts
  has_many :users, through: :user_arts
  accepts_nested_attributes_for :user_arts

  validates :name, presence: true, inclusion: { in: VALID_TYPES }

end
