class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  acts_as_votable
  acts_as_voter

  mount_uploader :profile_photo, ProfilePhotoUploader

  has_many :user_arts
  has_many :user_files
  has_many :pdfs
  has_many :art_types, through: :user_arts
  has_many :project_memberships
  has_many :projects, through: :project_memberships
  accepts_nested_attributes_for :art_types
  accepts_nested_attributes_for :user_arts
  has_many :conversations, foreign_key: :sender_id

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :username, presence: true

  def is_admin?
    role == 'admin'
  end

  include PgSearch
  pg_search_scope :search,
    against: [:first_name, :last_name, :username, :description, :city, :state,
              :website],
    associated_against: { art_types: :name },
    using: {
      tsearch: { prefix: true }
    }
end
