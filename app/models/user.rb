class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :artist_type

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :description, presence: true
  validates :artist_type, presence: true

  def self.search(search)
   where("first_name ILIKE ?
         OR last_name ILIKE ?
         OR description ILIKE ?
         OR artist_type_id.name ILIKE ?
         OR city ILIKE ?
         OR state ILIKE ?
         OR email ILIKE ? ", "%#{search}%",
         "%#{search}%", "%#{search}%", "%#{search}%",
         "%#{search}%", "%#{search}%", "%#{search}%"
        )
  end

  def is_admin?
    role == 'admin'
  end
end
