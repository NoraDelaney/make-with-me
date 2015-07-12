class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_arts
  has_many :art_types, through: :user_arts
  has_many :project_memberships
  has_many :projects, through: :project_memberships

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :description, presence: true
  validates :username, presence: true

  include PgSearch
  pg_search_scope :search,
    against: [:first_name, :last_name, :username, :description, :city, :state,
              :website],
    using: {
      tsearch: { prefix: true }
    }
end
